class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validate :check_out_after_check_in
  after_initialize :set_defaults
  def set_defaults
    accepted = false
  end
end

private

def check_out_after_check_in
  return unless check_in && check_out

  if check_out <= check_in
    errors.add(:check_out, "date must be after the check-in date")
  end
end
