class RestaurantsController < ApplicationController

  def index
    restaurants = Restaurant.all
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