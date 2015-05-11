class ProjectsController < ApplicationController
  #users must be authenticated befoe being able to create new posts
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_project, only:[:show, :edit, :update, :destroy]
  before_action :authorized_user, only:[:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new

  end

  def create
    @project = current_user.projects.build(project_params)

    # respond_to will be useful in the future if we will add ajax actions
    respond_to do |format|
      if @project.save
        # if the resource is saved go to resources index with the flash notice "Project Created"
        format.html{redirect_to edit_project_path(@project), notice: "Project created. Plese upload project pictures."}
      else
        format.html{render 'new', notice: "Something went wrong, please try again"}
      end
    end

  end

  def edit
    @picture = Picture.new
    @pictures = Picture.where(project: @project)
  end

  def update

    respond_to do |format|
      if @project.update(project_params)
        format.html{redirect_to project_path(@project)}
      else
        format.html{render 'edit', notice: "Something went wrong, please try again"}
      end
    end

  end

  def destroy

    @project.destroy
    redirect_to projects_path, notice: "Project Deleted"

  end

  private

    def project_params
      params.require(:project).permit(:title, :content, :repository, :website, :user_id) # permit only certain parameters to be inserted into database
    end

    def set_project
      @project = Project.find(params[:id])
    end

    # actions that can be performed only by the curren_user
    def authorized_user
      if @project.user != current_user
        redirect_to root_path, notice: "You are not authorized to perform this action"
      end
    end

end
