require 'test_helper'


class MovieTest < ActiveSupport::TestCase
  
  def setup
    @usr = User.create(username:"janas", email:"janas@o2.pl")
    @movie = @usr.movies.build(name: "Troja", rating: 2)
  end
  
  test "name should be valid" do
    assert @movie.valid?
  end
  
  test "user_id shouold be present" do
    @movie.user_id = nil
    assert_not @movie.valid?
    
    
  end
  
  test "name should be present" do
    @movie.name = " "
    assert_not @movie.valid?
  end
  
  
  test "name length too long" do
    @movie.name = "a" * 36
    assert_not @movie.valid?
  end
  
  
  test "name lenght too short" do
    @movie.name = "a"
    assert_not @movie.valid?
  end
  
  
  test "raiting should be no more than 10" do
    @movie.rating = 11
    assert_not @movie.valid?
  end
  
  test "raiting should be no less than 1 " do
    @movie.rating = 0
    assert_not @movie.valid?
    
  end
  
 test "raiting must be present" do
   
 end
  
end