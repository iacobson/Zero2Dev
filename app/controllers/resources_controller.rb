class ResourcesController < ApplicationController
  def index
  end

  def new
   @resource = Resource.new
  end
end
