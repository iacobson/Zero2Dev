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
    # after creating relation between User and Resource models, user is directly passed to the new resource
    @resource = current_user.resources.build(resource_params)
    # respond_to will be useful in the future if we will add ajax actions
    respond_to do |format|
      if @resource.save
        # if the resource is saved go to resources index with the flash notice "Resource Created"
        format.html{redirect_to resources_path, notice: "Resource created!"}
      else
        format.html{render 'new', notice: "Something went wrong, please try again"}
      end
    end
  end
  def destroy
    # authorization here as well as in the view
    @resource = current_user.resources.find(params[:id])
    @resource.destroy
    redirect_to :back
  end


  private

    def resource_params
      params.require(:resource).permit(:content, :user_id) # permit only certain parameters to be inserted into database
    end

end
