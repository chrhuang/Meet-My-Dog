class Dog < ApplicationRecord
  belongs_to :user
  has_many :temperaments, through: :dog_has_temperaments
  has_one_attached :photo
end
