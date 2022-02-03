class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @planes = policy_scope(Plane)
  end
end
