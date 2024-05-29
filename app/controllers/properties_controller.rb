class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
    @property.user = current_user
    @property.save
    redirect_to root_path
  end

  def destroy
    property = Property.find(params[:id])
    property.destroy
    redirect_to root_path
  end

  def user_properties
    @properties = Property.where(user: current_user)
  end


  private

  def property_params
    params.require(:property).permit(:price, :age, :city, :address, :bedrooms, :description, :user_id, :photo)
  end
end
