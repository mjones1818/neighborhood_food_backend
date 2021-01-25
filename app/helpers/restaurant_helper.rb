module RestaurantHelper

  def create_restaurants(new_restaurant,neighborhood)
    restaurant_hash = {}
    neighborhood = Neighborhood.where(entity_id: neighborhood).first
  
    new_restaurant.each do |restaurant|
      restaurant_hash[:url] = restaurant["restaurant"]["url"]
      restaurant_hash[:name] = restaurant["restaurant"]["name"]
      restaurant_hash[:address] = restaurant["restaurant"]["location"]["address"]
      restaurant_hash[:locality] = restaurant["restaurant"]["location"]["locality"]
      restaurant_hash[:price_range] = restaurant["restaurant"]["price_range"]
      restaurant_hash[:average_cost_for_two] = restaurant["restaurant"]["average_cost_for_two"]
      restaurant_hash[:aggregate_rating] = restaurant["restaurant"]["user_rating"]["aggregate_rating"]
      restaurant_hash[:all_reviews_count] = restaurant["restaurant"]["all_reviews_count"]
      restaurant_hash[:neighborhood_id] = neighborhood.id
      final_restaurant = Restaurant.create(restaurant_hash)
    end
  end
end