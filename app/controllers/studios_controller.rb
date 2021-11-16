class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @reservation = Reservation.new
  end
end
