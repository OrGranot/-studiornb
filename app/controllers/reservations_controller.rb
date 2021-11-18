class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(studio: params[:studio_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.studio_id = params[:studio_id]
    if @reservation.save!
      flash[:alert] = "Reservation requested!"
      redirect_to studio_path(params[:studio_id])
    else
      flash[:alert] = "Reservation failed"
    end
  end



  private

  def reservation_params
    params.require(:reservation).permit(:start_on, :end_on)
  end
end
