class Event < ApplicationRecord
  belongs_to :walk
  has_many :messages
  has_many :event_has_users
  has_many :users, through: :event_has_users
  has_many :dogs, through: :users

  def dogs_count
    self.users.map.sum { |user| user.dogs.count }
  end
end
