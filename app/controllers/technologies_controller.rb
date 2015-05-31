class TechnologiesController < ApplicationController
  before_action :authenticate_user!

  def create
    case params[:post_type]
    when "resources"
      @post = Resource.find(params[:post_id])
    when "projects"
      @post = Project.find(params[:post_id])
    when "collaborations"
      @post = Collaboration.find(params[:post_id])
    when "jobs"
      @post = Job.find(params[:post_id])
    end

    # split the tags submittet that are separated by commas (and space after commas)
    @technology = params[:technology].split(%r{,\s*})
    @post.technology_list.add(@technology, parse: true)
    respond_to do |format|
      if @post.save
        @current_post = Project.find(params[:post_id])
        format.html {redirect_to :back}
        format.js

      end
    end

  end

end
