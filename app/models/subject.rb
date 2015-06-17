class Subject < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  validates :name, presence: true, length: {maximum: 255}
  validates :tc, presence: true
  validates :lt, numericality: {only_integer: true}
  validates :bt, numericality: {only_integer: true}
  validates :subjectID, presence: true, uniqueness: true
  validates :species, presence: true
end
