class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
   @resource = Resource.new
  end

  def create
    Resource.create(permitted_params)
    redirect_to action: 'index'
  end


  private

  def permitted_params
    params.require(:resource).permit(:title, :content, :user_id) # permit only certain parameters to be inserted into database
  end

end


