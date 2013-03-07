require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # use these fixtures to run the tests
  fixtures :users, :albums, :photos

  def test_name_is_required
    peter = User.new

    assert !peter.valid?, "Should require username"
  end

  def test_name_has_no_spaces
    peter = User.new
    peter.username = "Peter"

    assert_no_match( /\s/, peter.username, "Should not allow spaces in username" )
  end

  def test_password_is_required
    peter = User.new
    peter.username = "Peter"

    assert !peter.valid?, "Should require password"
  end

  def test_password_is_long_enough
    peter = User.new
    peter.username = "Peter"
    peter.password = "1234"

    assert peter.password.length < 6, "Should require longer password"
  end

  def test_password_isnt_too_long
    peter = User.new
    peter.username = "Peter"
    peter.password = "123456789101234567891012345"

    assert peter.password.length > 24, "Should require shorter password"
  end

  def test_password_is_formatted_properly
    peter = User.new
    peter.username = "Peter"
    peter.password = "1234abcd"

    assert_match( /^(?=.*\d)(?=.*[a-zA-Z]).{8,24}$/, peter.password, "Should require password to contain at least one letter and one number, and be between 8 and 24 characters" )
  end

  def test_email_is_required
    peter = User.new
    peter.username = "Peter"
    peter.password = "1234abcd"

    assert !peter.valid?, "Should require email"
  end

  def test_email_is_properly_formatted
    peter = User.new
    peter.username = "Peter"
    peter.password = "1234abcd"
    peter.email = "peter@eldorado.com"

    assert_match( /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z.]{2,}$/i, peter.email, "Should require properly formatted email" )
  end

  def test_location_is_required
    peter = User.new
    peter.username = "Peter"
    peter.password = "1234abcd"
    peter.email = "peter@familyguy.com"

    assert !peter.valid?, "Should require location"
  end

  def test_date_of_birth_is_required
    peter = User.new
    peter.username = "Peter"
    peter.password = "1234abcd"
    peter.location = "Quahog"

  	assert !peter.valid?, "Should require date of birth"
  end

  def test_with_all_info
  	peter = User.new
    peter.username = "Peter"
    peter.password = "1234abcd"
    peter.location = "Quahog"
    peter.date_of_birth = "1969-12-05"

  	assert !peter.valid?, "Failed even with all required info"
  end

  def test_has_albums
  	august = users(:august)
  	assert august.has_albums?(albums(:trailblazer)), "Are you sure the Trailblazer album doesn't belong to August?  I think it should."
  	assert !august.has_albums?(albums(:cleanskies)), "August is not the owner of the CleanSkies album"
  end

  def test_doesnt_have_albums
  	august = users(:august)
  	luke = users(:luke)
  	assert_equal [albums(:trailblazer)], luke.doesnt_have_these_albums
  	assert_equal [albums(:cleanskies)], august.doesnt_have_these_albums
  	peter = User.new :username => "Peter",
  					 :password => "1234",
  					 :email => "peter@familyguy.com",
  					 :location => "Quahog",
  					 :date_of_birth => "1969-12-05"
  	assert_equal Album.find(:all), peter.doesnt_have_these_albums
  end
end
