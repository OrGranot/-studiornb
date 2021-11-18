class StudiosController < ApplicationController
  def index
    @studios = Studio.all
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

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    @studio = Studio.find(params[:id])
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end

  def destroy
    @studio = Studio.find(params[:id])
    @studio.destroy
    redirect_to studios_path
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :size, :equipment, :location, :description, :photo, :price)
  end
end
