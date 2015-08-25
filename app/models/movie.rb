class Movie < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 35}
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10, greater_than_or_equal_to: 1} 
end