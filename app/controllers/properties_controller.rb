class PropertiesController < ApplicationController
  def index
    @properties = Property.all
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

  private

  def property_params
    params.require(:property).permit(:price, :age, :address, :bedrooms, :description, :user_id)
  end
end
