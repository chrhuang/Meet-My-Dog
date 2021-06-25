class Temperament < ApplicationRecord
  has_many :dog_has_temperaments, dependent: :destroy
end
