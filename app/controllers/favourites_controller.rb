class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
    favourite = Favourite.new
    property = Property.find(params[:property_id])
    favourite.property = property
    favourite.user = current_user
    if favourite.save
      redirect_to favourites_path
    else
      @properties = Property.all
      p favourite.errors.messages
      render 'pages/home'
    end
  end

  def destroy
    favourite = Favourite.find(params[:id])
    favourite.destroy
    redirect_to request.referer
  end
end
