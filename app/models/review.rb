class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :site
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
