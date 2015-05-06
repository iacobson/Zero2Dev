require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:resources)).to eq(Resource.all)
    end
  end

  describe "POST #create as guest" do
    it "redirects to login if guest" do
      post :create, resource: {content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "POST #create as logged-in" do
    let(:user) {User.create!(name:"John", email:"john@mail.com", password:"password")}
    before(:example) do
      sign_in user
    end

    it "creates resource if user is logged-in" do
      post :create, resource: {content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(resources_path)
      expect(assigns(:resource).content).to eq(Resource.first.content)
    end

    it "goes back to form on failure" do
      post :create, resource: {content: ""}
      expect(response).to render_template(:new)
      expect(assigns(:resource)).to be_present
    end


  end

end
