class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show

  end

  def create
    user = User.find_or_create_by(name: params[:name])
    render json: user
  end

  def new 
    byebug
    # render json:
  end
end