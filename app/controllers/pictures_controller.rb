class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:destroy]
  before_action :authorized_user, only: [:destroy]

  def create
    @picture = current_user.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html{redirect_to :back}
        format.js
      else
        format.html{redirect_to :back, notice: "Something went wrong, please try again"}
      end

    end

  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end



  private

    def picture_params
      params.require(:picture).permit(:image, :user_id, :project_id)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end

    # actions that can be performed only by the curren_user
    def authorized_user
      if @picture.user != current_user
        redirect_to root_path, notice: "You are not authorized to perform this action"
      end
    end

end
