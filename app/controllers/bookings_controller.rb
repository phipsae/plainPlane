class BookingsController < ApplicationController
  before_action :set_plane, only: [ :create ]
  before_action :set_booking, only: [ :update ]
  def index
    @bookings = policy_scope(Booking) # current_user.bookings policy_scope(Booking)
    @user_planes = current_user.planes
  end

  def show; end

  def new
    # @plane = Plane.find(params[:plane_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.plane = @plane
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to plane_path(@plane)
    else
      render :new
    end
  end

  def edit; end

  def update
    index
    authorize @booking
    @booking.update(booking_params)
    render :index
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_plane
    @plane = Plane.find(params[:plane_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
