class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user: current_user)

    fav_properties = Property.includes(:favourites).where(favourites: { user: current_user })

    @markers = fav_properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window_html: render_to_string(partial: "properties/info_window", locals: {property: property}),
        marker_html: render_to_string(partial: "properties/marker", locals: {property: property})
      }
    end
  end

  def create
    favourite = Favourite.new
    property = Property.find(params[:property_id])
    favourite.property = property
    favourite.user = current_user
    if favourite.save
      redirect_to request.referer
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
