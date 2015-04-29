# Created registrations_controller.rb to override the 2 methods below from standard Devise conroller, in order to accept "name" for the user. Any future attributes that will be added to the User needs to be included here
# Tutorial here: http://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html
class RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name)
    end


end
