class UsersController < ApplicationController
  before_action :set_user, only:[:show]
  
  def show
  end

  # enable auto developer login just for development environment (Bypass Login During Development)
  if Rails.env.development?
    def dev_login
      User.create(name: 'RailsDeveloper', email: 'railsdev@blah.com', password: 'blahblahblah') if !(User.find_by(name: 'RailsDeveloper'))
      @user = User.find_by(name: 'RailsDeveloper')
      sign_in(@user)
      redirect_to :root
    end
  end

  private
    def set_user
      # find the user by username (not by ID)
      @user = User.find(params[:id])
    end
end
