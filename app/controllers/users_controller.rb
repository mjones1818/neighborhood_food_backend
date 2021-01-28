class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    user = User.find_or_create_by(name: params[:id])
    render json: user, include: [:user_restaurants]
  end

  def create
    user = User.find_or_create_by(name: params[:name])
    render json: user, include: [:user_restaurants]
  end

  def new 
    
    # render json:
  end

  def liked
    user = User.find_by(id: params[:id])
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    if !restaurant.user_ids.include?(user.id)
      restaurant.users << user
    else
      user_restaurant = UserRestaurant.where(user_id: user.id, restaurant_id: restaurant.id).first
      user_restaurant.delete
    end
  end
end

# UserRestaurant.where(user_id: @project.id, restaurant_id: part.id)