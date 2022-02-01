class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_plane, only: [:show, :edit, :update, :destroy]

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
    @user = current_user
    @plane.user = @user
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_plane
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:name, :price, :availability, :plane_model_id)
  end
end
