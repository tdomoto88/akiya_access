class MapController < ApplicationController

  def index
    @properties = Property.geocoded
    @markers = @properties.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {property: property}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
