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
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :size, :equipment, :location, :description)
  end

end
