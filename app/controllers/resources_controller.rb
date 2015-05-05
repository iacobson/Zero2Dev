class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
   redirect_to new_user_session_path if !current_user
   @resource = Resource.new
  end

  def create
    Resource.create(permitted_params)
    redirect_to action: 'index'
  end


  private

  def permitted_params
    params.require(:resource).permit(:content, :user_id) # permit only certain parameters to be inserted into database
  end

end


