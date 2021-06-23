class Walk < ApplicationRecord
  belongs_to :site
  has_many :events, dependent: :destroy
  has_many :pois, through: :walk_has_pois
  has_one_attached :photo
end
