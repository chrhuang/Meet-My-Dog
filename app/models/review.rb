class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :site
end
