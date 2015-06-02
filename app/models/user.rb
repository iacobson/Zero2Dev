class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :resources
  has_many :projects
  has_many :pictures

  validates :username, presence: true, uniqueness: true

  # method from acts_as_taggable_on. The user is the tagger
  acts_as_tagger

end
