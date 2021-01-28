class RestaurantsController < ApplicationController

  def index
    search_params = {}
    result = params.reject {|k,v| k.exclude?('_')}
    params.each do |k,v|
      search_params[k.to_sym] = v.to_sym
    end
    restaurants = Api.search(search_params)
    # byebug
    neighborhood = Neighborhood.find_by(entity_id: params['entity_id'])
    restaurants = restaurants.each {|k| k['restaurant']['neighborhood'] = neighborhood}
    restaurants = Restaurant.create_restaurants(restaurants)
    render json: restaurants
  end

  def show
    restaurant = Restaurant.find_by_id(params[:id])
    render json: restaurant
  end

  def new
    @neighborhoods = Neighborhood.all
    @cuisines = Cuisine.all
  end

  def create
    Restaurant.destroy_all
    new_restaurant = Api.search(search_params)
    helpers.create_restaurants(new_restaurant,search_params[:entity_id])
    redirect_to restaurants_path
  end

  private

  def search_params
    new_hash = {}
    result = params.require(:search).permit(:entity_id, :cuisine_id).to_h
    result.each {|k,v| new_hash[k.to_sym] = v.to_i}
    new_hash
  end

end