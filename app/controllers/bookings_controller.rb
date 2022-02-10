class BookingsController < ApplicationController
  before_action :set_plane, only: [ :create ]
  before_action :set_booking, only: [ :update ]
  def index
    @bookings = policy_scope(Booking) # current_user.bookings policy_scope(Booking)
    @user_planes = current_user.planes
    @sorted_bookings = @bookings.order('start_date ASC')
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
      redirect_to bookings_path
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


  # { pending: 0, confirmed: 1, declined: 2, accepted: 3, cancelled: 4, paid: 5 }
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
