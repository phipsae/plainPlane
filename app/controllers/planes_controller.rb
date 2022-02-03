class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_planes, only: [ :show, :edit, :update, :destroy, :deactivate ]

  def index
    @planes = policy_scope(Plane)
  end

  def show
    authorize @plane
  end

  def new
    @plane = Plane.new
    authorize @plane
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

  def edit
    authorize @plane
  end

  def update
    authorize @plane
    @plane.update(plane_params)

    if @plane.availability
      redirect_to plane_path(@plane)
    else
      redirect_to root_path
    end
  end

  def destroy; end

  private

  def set_planes
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:name, :price, :availability, :plane_model_id, :photo)
  end
end
