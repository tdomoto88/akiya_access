class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
    @favourite = Favourite.new(favourite_params)
    @property = Property.find(params[:property_id])
  end

  def destroy
  end

  private

  def favourite_params
    params.require(:favourite).permit(:user_id, :property_id)
  end
end
