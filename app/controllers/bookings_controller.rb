class BookingsController < ApplicationController
  def user_bookings
    @bookings = Booking.where(user: current_user)
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
    @booking = Booking.find(params[:booking_id])
  end

  def update
    @booking = Booking.find(params[:booking_id])
    @booking.update(booking_params)
    redirect_to property_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guests, :user_id, :property_id)
  end
end
