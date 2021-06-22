class SitePhoto < ApplicationRecord
  belongs_to :site
  has_one_attached :photo
end
