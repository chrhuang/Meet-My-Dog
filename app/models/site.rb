class Site < ApplicationRecord
  has_many :site_photos, dependent: :destroy
  has_many_attached :photos
  has_many :walks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: ->(obj) { obj.latitude.present? and obj.longitude.present? }
end
