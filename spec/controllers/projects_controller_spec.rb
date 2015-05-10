require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:projects)).to eq(Project.all)
    end
  end

  describe "POST #create" do
    let(:user) {User.create!(name:"John", email:"john@mail.com", password:"password")}

    it "redirects to login if guest" do
      post :create, project: {title: "First Project", content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(new_user_session_path)
    end

    it "creates resource if user is logged-in" do
      sign_in user
      post :create, project: {title: "First Project", content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(projects_path)
      expect(assigns(:project).content).to eq(Project.first.content)
    end

    it "goes back to form on failure, if repository is not URL format" do
      sign_in user
      post :create, project: {title: "First Project", content: "Neque porro quisquam est qui dolorem ipsum", repository:"github/project"}
      expect(response).to render_template(:new)
      expect(assigns(:project)).to be_present
    end
  end

end
