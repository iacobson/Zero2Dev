require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    # create a user
    let(:user) {User.create!(name:"John", email:"john@mail.com", password:"password")}
    # even if the guests do not create an account, it is still good to have access to the users profiles and to see their projects
    it "shows a user to non-logged-in guest" do
      get :show, id: user
      expect(response).to render_template(:show)
      # show should pass an instance variable @user to the show template
      expect(assigns(:user)).to eq(user)
    end

  end

end
