class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @planes = Plane.all
  end

  def new
    @plane = Plane.new
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

  private

  def plane_params
    params.require(:plane).permit(:name, :price, :availability, :plane_model_id)
  end
end
