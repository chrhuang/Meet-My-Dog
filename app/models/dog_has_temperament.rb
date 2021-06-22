class DogHasTemperament < ApplicationRecord
  belongs_to :temperament
  belongs_to :dog
end
