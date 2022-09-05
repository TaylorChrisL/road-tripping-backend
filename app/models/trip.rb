class Trip < ApplicationRecord
  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :places
  has_many :messages
  belongs_to :user, foreign_key: :owner_id
end
