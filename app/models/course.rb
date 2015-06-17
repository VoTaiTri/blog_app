class Course < ActiveRecord::Base
  belongs_to :subject
  
  validates_presence_of :courseID, :enroll, message: "Khong duoc de trong"
  validates_uniqueness_of :courseID, message: "Phai duy nhat"
  validate :valid_enroll

  private
  def valid_enroll
    if !enroll.blank? && !max_enroll.blank? && enroll > max_enroll
      errors.add "Số lượng đăng ký", " phải nhỏ hơn số lượng đăng ký tối đa."
    end
  end
end
