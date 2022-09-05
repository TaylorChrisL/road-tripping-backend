class Trip < ApplicationRecord
  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :places
  belongs_to :owner, class_name: "User", foreign_key: :user_id
end
