class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_on, :end_on, :studio_id, :user_id, :approved)
  end
end
