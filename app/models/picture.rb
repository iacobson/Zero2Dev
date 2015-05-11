class Picture < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  # 'gem paperclip' method
  has_attached_file :image

  validates_presence_of :user_id, :project_id, :image

  #accepting only image files
  validates_attachment_content_type :image,
    content_type:  /^image\/(png|gif|jpeg)/,
    message: "Only image filse allowed"

  default_scope -> { order(created_at: :desc) }

  validate  :image_size

  private

    # Validates the size of an uploaded picture.
    # This is backed by frontend JS validation in app/assets/javascripts/pictures.coffee
    def image_size
      if image_file_size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
