class DashboardsController < ApplicationController
  def show
    @reservations = Reservation.where(user: current_user)
  end
end
