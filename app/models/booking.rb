class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validate :check_out_after_check_in
  after_initialize :set_defaults

  private

  def set_defaults
    self.accepted = false if self.accepted.nil?
  end
end

class AddAcceptedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :accepted, :boolean, default: false
  end
end

private

def check_out_after_check_in
  return unless check_in && check_out
  if check_out <= check_in
    errors.add(:check_out, "date must be after the check-in date")
  end
end
