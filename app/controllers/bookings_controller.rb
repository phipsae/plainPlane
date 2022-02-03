class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking) # current_user.bookings policy_scope(Booking)
    @user_planes = current_user.planes
  end

  def show; end

  def new; end

  def create; end
end
