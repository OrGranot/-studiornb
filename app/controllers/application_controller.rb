class ApplicationController < ActionController::Base
  def logged_in?
    !current_user.nil?
  end
end
