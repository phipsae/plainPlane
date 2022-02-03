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

  def edit; end

  def update
    @plane.update(plane_params)

    redirect_to plane_path(@plane)
  end

  def destroy; end

  private

  def set_planes
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:name, :price, :availability, :plane_model_id)
  end
end
