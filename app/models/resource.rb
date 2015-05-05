class Resource < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user_id, :content

  # sort the resources descending. The last will be at the top of the list
  default_scope -> { order(created_at: :desc) }

end
