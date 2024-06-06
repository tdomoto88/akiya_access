class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @properties = Property.geocoded.map
    @properties = Property.all
    if params[:query].present?
      sql_subquery = "city ILIKE :query OR prefecture ILIKE :query"
      @properties = @properties.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {property: property}),
        marker_html: render_to_string(partial: "marker", locals: {property: property})
      }
    end
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user=current_user
    if @property.save
      redirect_to user_properties, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def destroy
    property = Property.find(params[:id])
    property.destroy
    redirect_to root_path
  end

  def user_properties
    @properties = Property.where(user: current_user)
  end

  def show
    @property = Property.find(params[:id])
    current_view_count = @property.views.nil? ? 0 : @property.views
    @property.update(views: current_view_count + 1)
  end

  private

  def property_params
    params.require(:property).permit(:price, :age, :city, :prefecture, :address, :bedrooms, :description, :photo)
  end
end
