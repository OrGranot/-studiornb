class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @studios = policy_scope(Studio)
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user = current_user
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def show

    @studio = Studio.find(params[:id])
    @reservation = Reservation.new
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :size, :equipment, :location, :description)
  end

end
