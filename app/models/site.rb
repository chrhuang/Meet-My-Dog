class Site < ApplicationRecord
  has_many :site_photos, dependent: :destroy
  has_many :walks, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
