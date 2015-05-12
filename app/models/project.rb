class Project < ActiveRecord::Base

  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates_presence_of :user_id, :content, :title
  # validates that website and repository fields are URLs
  # 'allow_blank' will leave the user to submit the project without website or github link,
  # otherwise we get validation error
  validates_format_of :website, :with => URI::regexp(%w(http https)),
                      message: "please enter a valid URL", allow_blank: true
  validates_format_of :repository, :with => URI::regexp(%w(http https)),
                      message: "please enter a valid URL", allow_blank: true

  # sort the resources descending. The last will be at the top of the list
  default_scope -> { order(created_at: :desc) }

  # to be used in projects index
  def project_thumbnails
    self.pictures.first(3)
  end

end
