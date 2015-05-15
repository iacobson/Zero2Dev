require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let(:user1) {User.create!(name:"John", email:"john@mail.com", password:"password")}
  let(:user2) {User.create!(name:"Mary", email:"mary@mail.com", password:"password")}
  let(:project) {user1.projects.create!(title: "First Project", content: "Neque porro quisquam est qui dolorem ipsum")}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:projects)).to eq(Project.all)
    end
  end

  describe "POST #create" do

    it "redirects to login if guest" do
      post :create, project: {title: "First Project", content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(new_user_session_path)
    end

    it "creates project if user is logged-in" do
      sign_in user1
      post :create, project: {title: "First Project", content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(edit_project_path(Project.first))
      expect(assigns(:project).content).to eq(Project.first.content)
    end

    it "goes back to form on failure, if repository is not URL format" do
      sign_in user1
      post :create, project: {title: "First Project", content: "Neque porro quisquam est qui dolorem ipsum", repository:"github/project"}
      expect(response).to render_template(:new)
      expect(assigns(:project)).to be_present
    end
  end

  describe "GET #edit/:id" do

    it 'redirects to sign_in page if guest' do
      get :edit, id: project.id
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'renders edit page if correct user' do
      sign_in user1
      get :edit, id: project.id
      expect(response).to have_http_status(:success)
      expect(assigns(:project)).to eq(project)
    end

    it 'redirects to home page if wrong user' do
      sign_in user2
      get :edit, id: project.id
      expect(response).to redirect_to(root_path)
    end
  end

end
