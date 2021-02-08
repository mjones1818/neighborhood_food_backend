class Restaurant < ApplicationRecord
  has_many :restaurant_cuisines
  has_many :cuisines, through: :restaurant_cuisines
  belongs_to :neighborhood
  has_many :user_restaurants
  has_many :users,  through: :user_restaurants
  before_destroy :abort_if_associated, prepend: true

  def abort_if_associated
    if !self.users.empty?
      errors[:base] << 'can not delete restaurant that has an association'
      throw :abort
    end
  end

  def self.create_restaurants(restaurants)
    restaurant_hash = {}
    restaurant_return = []
    restaurants.each do |restaurant|
      neighborhood = 
      restaurant_hash[:url] = restaurant["restaurant"]["url"]
      restaurant_hash[:name] = restaurant["restaurant"]["name"]
      restaurant_hash[:address] = restaurant["restaurant"]["location"]["address"]
      restaurant_hash[:locality] = restaurant["restaurant"]["location"]["locality"]
      restaurant_hash[:price_range] = restaurant["restaurant"]["price_range"]
      restaurant_hash[:average_cost_for_two] = restaurant["restaurant"]["average_cost_for_two"]
      restaurant_hash[:aggregate_rating] = restaurant["restaurant"]["user_rating"]["aggregate_rating"]
      restaurant_hash[:all_reviews_count] = restaurant["restaurant"]["all_reviews_count"]
      restaurant_hash[:thumb] = restaurant["restaurant"]["thumb"]
      restaurant_hash[:featured_image] = restaurant["restaurant"]["featured_image"]
      restaurant_hash[:neighborhood] = restaurant["restaurant"]["neighborhood"]
      restaurant_hash[:cuisine_id] = restaurant['restaurant']['cuisine_id']
      final_restaurant = Restaurant.find_or_create_by(restaurant_hash)
      restaurant['restaurant']['db_id'] = final_restaurant.id
      restaurant_return << restaurant
    end
    return restaurant_return
  end
end
