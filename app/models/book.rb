class Book < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 100}
  validates :author, presence: true, length: {maximum: 100}
  validate  :picture_size

  mount_uploader :image, ImageUploader

  private
  def picture_size
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end

end