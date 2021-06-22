class Event < ApplicationRecord
  belongs_to :walk
  has_many :messages
  has_many :users, through: :event_has_users
end
