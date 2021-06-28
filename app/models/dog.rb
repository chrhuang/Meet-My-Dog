class Dog < ApplicationRecord
  belongs_to :user
  has_many :temperaments, through: :dog_has_temperaments
  has_many :dog_has_temperaments, dependent: :destroy
  has_one_attached :photo
  validates :name, :age, :size, :gender, presence: true
end
