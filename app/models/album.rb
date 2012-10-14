class Album < ActiveRecord::Base
  attr_accessible :album_description, :album_name, :date_created, :user_id

  # each album is linked to a user with user_id
  belongs_to :user

  # an album can have many photos
  has_many :photos, :dependent => :destroy

  validates_presence_of :user
end
