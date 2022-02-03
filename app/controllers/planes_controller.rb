class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_planes, only: [ :show, :edit, :update ]

  def index
    @planes = Plane.all
  end

  def show
    @booking = Booking.new(plane: @plane)
  end

  def new
    @plane = Plane.new
  end

  def create
    @plane = Plane.new(plane_params)
    @plane.user = current_user
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new
    end
  end

  def edit; end

  def update
    @plane.update(plane_params)

    redirect_to plane_path(@plane)
  end

  private

  def set_planes
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:name, :price, :availability, :plane_model_id)
  end
end
