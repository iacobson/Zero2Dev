class ProjectsController < ApplicationController
  #users must be authenticated befoe being able to create new posts
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_project, only:[:show, :edit, :update, :destroy]
  #cancan authorization method. Authorizations set in app/models/ability.rb
  load_and_authorize_resource through: :current_user, except: [:index, :show]

  def index
    # select all technologies tags for Project Model, and maps them to array
    # request done with 'squeel' gem
    @technologies = ActsAsTaggableOn::Tagging.includes(:tag).where{(taggable_type == "Project") & (context == 'technologies')}.map{|tagging| tagging.tag.name}.uniq

    # display only projects tagged with specific technology (acts_as_taggable_on method)
    if params[:technology]
      # keep the persistence of selected checkboxes
      @selected_technology = params[:technology]
      # 'any: true' - if more checkboxes selected, will return all matching results for each
      @projects = Project.tagged_with(params[:technology], any: true)
    else
      @projects = Project.all
      #empty array not to return error on index page
      @selected_technology=[]
    end
  end

  def new
    @project = Project.new(user_id: current_user.id)
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

  def show
    @pictures = @project.pictures
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
      params.require(:project).permit(:title, :content, :repository, :website, :user_id, :technology_list) # permit only certain parameters to be inserted into database
    end

    def set_project
      @project = Project.find(params[:id])
    end


end
