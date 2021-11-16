class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def new
    @studio = Studio.new
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.save
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :size, :equipment, :location, :description)
  end

end
