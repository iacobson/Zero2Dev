require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    post :create, project: {name: "Runway", tasks: "Start something:2"}
      expect(response).to redirect_to(projects_path)
      expect(assigns(:action).project.name).to eq("Runway")

  end

end
