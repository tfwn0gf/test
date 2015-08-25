require 'test_helper'


class UserTest < ActiveSupport::TestCase
  
  def setup
  @user = User.new(username: "john", email: "john@example.com")
  end
  
  
  test "username should be valid" do
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end
  
  test "username should be not too short" do
    @user.username = "aa"
    assert_not @user.valid?
  end
  
  test "username should not be too long" do
    @user.username = "a" * 16
    assert_not @user.valid?
  end
  
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "email length should be within bounds" do
    @user.email = "a" * 101 + "@example.com"
    assert_not @user.valid?
   end
   
   test "email users should be unique" do
     dup_usr = @user.dup
     dup_usr.email = @user.email.upcase
     @user.save
     assert_not dup_usr.valid?
   end
  
  
  test "email validation should accept valid adresses" do
  valid_adresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.eu laura+joe@monk.com]
  valid_adresses.each do |va|
    @user.email = va
    assert @user.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject valid adresses" do
    invalid_adresses = %w[user@example,com user_at_ee.org user.name@example. ee@i_am_.com foo@ee+aar.com]
    invalid_adresses.each do |ia|
      @user.email = ia
      assert_not @user.valid?, '#{ia.inspect} should be invalid'
    end
    
  end
  
end