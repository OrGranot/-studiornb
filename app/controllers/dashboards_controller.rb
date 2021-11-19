class DashboardsController < ApplicationController
  def show
    @reservations = Reservation.where(user: current_user)
    @studios = Studio.where(user: current_user)

  end

  def studios
    @studios = Studio.where(user: current_user)
    redirect_to dashboards_path(page: 'studios')
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to dashboards_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo)
  end

end
