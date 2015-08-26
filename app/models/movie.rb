class Movie < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 35}
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10, greater_than_or_equal_to: 1} 
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5 MB")
    end
  end
end