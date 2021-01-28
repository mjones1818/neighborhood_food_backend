# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cuisine.destroy_all
Neighborhood.destroy_all
Restaurant.destroy_all
User.destroy_all
UserRestaurant.destroy_all

#cuisines = JSON.parse(Api.cuisine_request)["cuisines"]
cuisines = Api.cuisine_request
cuisines.each do |cuisine|
  cuisine_hash = {}
  cuisine_hash[:cuisine_id] = cuisine["cuisine"]["cuisine_id"]
  cuisine_hash[:name] = cuisine["cuisine"]["cuisine_name"]
  new_cuisine = Cuisine.create(cuisine_hash)
end

neighborhood_list = ["logan square chicago", "ukrainian village", "lakeview chicago", 'west loop chicago', 'uptown chicago']
neighborhood_list.each do |neighborhood|
  new_neighborhood = Api.neighborhood_request(neighborhood)
  neighborhood_hash = {}
  neighborhood_hash[:name] = new_neighborhood["title"].split(",").first
  neighborhood_hash[:entity_id] = new_neighborhood["entity_id"]
  neighborhood_hash[:entity_type] = new_neighborhood["entity_type"]
  Neighborhood.create(neighborhood_hash)
end

# Neighborhood.all.each do |neighborhood|
#   restaurant_hash = {}
#   test_cuisine = Cuisine.find_by_name("Asian")
#   search ={}
#   search[:entity_id] = neighborhood.entity_id
#   search[:cuisine_id] = test_cuisine.cuisine_id
#   new_restaurant = Api.search(search)
#   new_restaurant.each do |restaurant|
#     restaurant_hash[:url] = restaurant["restaurant"]["url"]
#     restaurant_hash[:name] = restaurant["restaurant"]["name"]
#     restaurant_hash[:address] = restaurant["restaurant"]["location"]["address"]
#     restaurant_hash[:locality] = restaurant["restaurant"]["location"]["locality"]
#     restaurant_hash[:price_range] = restaurant["restaurant"]["price_range"]
#     restaurant_hash[:average_cost_for_two] = restaurant["restaurant"]["average_cost_for_two"]
#     restaurant_hash[:aggregate_rating] = restaurant["restaurant"]["user_rating"]["aggregate_rating"]
#     restaurant_hash[:all_reviews_count] = restaurant["restaurant"]["all_reviews_count"]
#     restaurant_hash[:thumb] = restaurant["restaurant"]["thumb"]
#     restaurant_hash[:featured_image] = restaurant["restaurant"]["featured_image"]
#     restaurant_hash[:neighborhood] = neighborhood
#     final_restaurant = Restaurant.create(restaurant_hash)
#   end
# end
