class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dogs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages
  has_many :event_has_users
  has_many :events, through: :event_has_users
  has_one_attached :photo
end
