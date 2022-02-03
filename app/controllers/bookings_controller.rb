class BookingsController < ApplicationController
  before_action :set_plane
  def index
    @bookings = policy_scope(Booking) # current_user.bookings policy_scope(Booking)
    @user_planes = current_user.planes
  end

  def show; end

  def new
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @plane = Plane.find(params[:plane_id])
    @booking.plane = @plane
    @booking.user = current_user

    if @booking.save
      redirect_to plane_path(@plane)
    else
      render :new
    end
  end

  private

  def set_plane
    @plane = Plane.find(params[:plane_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
