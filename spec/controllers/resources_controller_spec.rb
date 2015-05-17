require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:resources)).to eq(Resource.all)
    end
  end

  describe "POST #create" do
    let(:user) {FactoryGirl.create(:user)}

    it "redirects to login if guest" do
      post :create, resource: {content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(new_user_session_path)
    end

    it "creates resource if user is logged-in" do
      sign_in user
      post :create, resource: {content: "Neque porro quisquam est qui dolorem ipsum"}
      expect(response).to redirect_to(resources_path)
      expect(assigns(:resource).content).to eq(Resource.first.content)
    end

    it "goes back to form on failure" do
      sign_in user
      post :create, resource: {content: ""}
      expect(response).to render_template(:new)
      expect(assigns(:resource)).to be_present
    end
  end

  describe "DELETE #destroy" do
    let(:user1) {FactoryGirl.create(:user)}
    let(:user2) {FactoryGirl.create(:user)}
    let(:resource){FactoryGirl.create(:resource, user: user1)}


    it "deletes resource when user1 (that created the resource) is logged-in" do
      sign_in user1      # request env should be specified if the controller action is redirecting back.
      request.env["HTTP_REFERER"] = "/resources"
      delete :destroy, id: resource.id
      expect(Resource.find_by(id: resource.id)).to be_nil
    end

    it "resutls error when user2 will delete user1 post" do
      sign_in user2
      expect{ delete :destroy, id: resource.id }.to raise_error
    end

    it "redirects to login if guest tries to delete resource" do
      delete :destroy, id: resource.id
      expect(response).to redirect_to(new_user_session_path)
    end

  end


end
