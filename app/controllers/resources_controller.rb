class ResourcesController < ApplicationController
  #users must be authenticated befoe being able to create new posts
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @resources = Resource.all
  end

  def new
   @resource = Resource.new
  end

  def create
    Resource.create(resource_params)
    redirect_to action: 'index'
  end


  private

  def resource_params
    params.require(:resource).permit(:content, :user_id) # permit only certain parameters to be inserted into database
  end

end
