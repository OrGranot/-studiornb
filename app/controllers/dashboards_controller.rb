class DashboardsController < ApplicationController
  def show
    @reservations = Reservation.where(user: current_user)
  end

  def studios
    @studios = Studio.where(user: current_user)
  end

  def pandingResevations
    @studios = Studio.where(user: current_user)

  end

end
