class Site < ApplicationRecord
  has_many :site_photos, dependent: :destroy
  has_many_attached :photos
  has_many :walks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  reverse_geocoded_by :lat, :long
  after_validation :reverse_geocode, if: ->(obj) { obj.lat.present? and obj.long.present? }  # auto-fetch address
end
