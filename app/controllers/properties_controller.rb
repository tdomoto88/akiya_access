class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {property: property}),
        marker_html: render_to_string(partial: "marker", locals: {property: property})
      }
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.save
    redirect_to root_path
  end

  def destroy
    property = Property.find(params[:id])
    property.destroy
    redirect_to root_path
  end

  def search_result
        @properties = Property.geocoded
        @markers = @properties.map do |property|
          {
            lat: property.latitude,
            lng: property.longitude,
            info_window_html: render_to_string(partial: "info_window", locals: {property: property}),
            marker_html: render_to_string(partial: "marker", locals: {property: property})
          }
        end
  end

  private

  def property_params
    params.require(:property).permit(:price, :age, :address, :bedrooms, :description, :user_id)
  end
end
