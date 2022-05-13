class Student < ApplicationRecord
  belongs_to :curso
  validates :name, presence: true
  validates :genero, presence: true
  validates :edad, presence: true
end
