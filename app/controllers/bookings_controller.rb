class BookingsController < ApplicationController

  def user_bookings
    @bookings = Booking.where(user: current_user)
    @properties = Property.where(user: current_user)
    @bookings_pending =  Booking.joins(:property).where("properties.user_id=?", current_user.id)
  end

  def property_bookings

    @bookings = Booking.where(property: )
  end

  def new
    @property = Property.find(params[:property_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @property = Property.find(params[:property_id])
    @booking.property = @property
    @booking.user = current_user
    @booking.save
    redirect_to user_bookings_path
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to user_bookings_path
  end


  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guests, :user_id, :property_id, :accepted)
  end
end
