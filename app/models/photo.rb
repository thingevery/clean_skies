class Photo < ActiveRecord::Base
  attr_accessible :album_id, :date_taken, :photo_description, :title

  # each photo is linked to an album with album_id
  belongs_to :album

  
  validates_presence_of :album

end
