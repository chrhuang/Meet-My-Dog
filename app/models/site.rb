class Site < ApplicationRecord
  has_many :site_photos
  has_many :walks
  has_many :reviews
end
