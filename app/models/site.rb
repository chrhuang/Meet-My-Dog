class Site < ApplicationRecord
  has_many :site_photos, dependent: :destroy
  has_many_attached :photos
  has_many :walks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: ->(obj) { obj.latitude.present? and obj.longitude.present? }  # auto-fetch address
end
