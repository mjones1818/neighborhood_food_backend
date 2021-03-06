class RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    search_params = {}
    result = params.reject {|k,v| k.exclude?('_')}
    params.each do |k,v|
      search_params[k.to_sym] = v.to_sym
    end
    restaurants = Api.search(search_params)
    neighborhood = Neighborhood.find_by(entity_id: params['entity_id'])
    restaurants = restaurants.each {|k| k['restaurant']['neighborhood'] = neighborhood}
    restaurants = restaurants.each {|k| k['restaurant']['cuisine_id'] = search_params[:cuisine_id].to_s}
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

  def destroy
    # byebug
    restaurants = Restaurant.destroy_all
    render json: restaurants
  end

  private

  def search_params
    new_hash = {}
    result = params.require(:search).permit(:entity_id, :cuisine_id).to_h
    result.each {|k,v| new_hash[k.to_sym] = v.to_i}
    new_hash
  end

end