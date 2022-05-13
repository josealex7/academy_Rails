class Curso < ApplicationRecord
  has_many :students
  has_many :students, dependent: :destroy
  validates :name, presence: true
  validates :grado, presence: true
end
