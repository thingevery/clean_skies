class User < ActiveRecord::Base
  attr_accessible :date_joined, :description, :email, :location, :nickname, :password, :profile_pic, :username

  # a user can have many albums
  has_many :albums, :dependent => :destroy

end
