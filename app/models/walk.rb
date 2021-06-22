class Walk < ApplicationRecord
  belongs_to :site
  has_many :events
  has_many :pois, through: :walk_has_pois
end
