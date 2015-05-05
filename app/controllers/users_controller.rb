class UsersController < ApplicationController
  def show
  end

  def dev_login
    User.create(name: 'RailsDeveloper', email: 'railsdev@blah.com', password: 'blahblahblah') if !(User.find_by(name: 'RailsDeveloper'))
    @user = User.find_by(name: 'RailsDeveloper')
    sign_in(@user)
    redirect_to :root
  end
end
