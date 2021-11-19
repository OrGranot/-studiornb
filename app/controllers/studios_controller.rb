class StudiosController < ApplicationController
  def index

    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @studios = Studio.where(sql_query, query: "%#{params[:query]}%")
          @markers = @studios.geocoded.map do |studio|
          {
            lat: studio.latitude,
            lng: studio.longitude,
            info_window: render_to_string(partial: "info_window", locals: { studio: studio })
          }
        end

    else
      @studios = Studio.all
        @markers = @studios.geocoded.map do |studio|
        {
          lat: studio.latitude,
          lng: studio.longitude,
          info_window: render_to_string(partial: "info_window", locals: { studio: studio })
        }
        end
    end
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
    params.require(:studio).permit(:name, :size, :equipment, :address, :description, :photo, :price)
  end

end
