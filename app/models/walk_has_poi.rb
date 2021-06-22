class WalkHasPoi < ApplicationRecord
  belongs_to :poi
  belongs_to :walk
  has_one_attached :photo
end
