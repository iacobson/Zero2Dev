class Picture < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  # 'gem carrierwave' method
  mount_uploader :image, ImageUploader

  validates_presence_of :user_id, :project_id, :image



  default_scope -> { order(created_at: :desc) }

  validate  :image_size

  private

    # Validates the size of an uploaded picture.
    # This is backed by frontend JS validation in app/assets/javascripts/pictures.coffee
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
