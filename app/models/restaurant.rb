class Restaurant < ApplicationRecord
  has_many :restaurant_cuisines
  has_many :cuisines, through: :restaurant_cuisines
  belongs_to :neighborhood
  has_many :user_restaurants
  has_many :users,  through: :user_restaurants
end
