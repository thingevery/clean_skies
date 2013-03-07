class User < ActiveRecord::Base
  attr_accessible :date_joined,
  				  :date_of_birth, 
  				  :description, 
  				  :email, 
  				  :location, 
  				  :nickname, 
  				  :password, 
  				  :profile_pic, 
  				  :username

  # a user can have many albums
  has_many :albums, :dependent => :destroy

  validates :username, :presence => true
  validates :password, :presence => true
  validates :location, :presence => true
  validates :email, :presence => true
  validates :date_of_birth, :presence => true

  def has_albums?(album)
    self.albums.include?(album)
  end

  def doesnt_have_these_albums
    Album.find(:all) - self.albums
  end

end
