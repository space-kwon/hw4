class ApplicationController < ActionController::Base
  # Make the current_user method available in all views
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  def require_login
   unless @current_user
    redirect_to login_path, alert: "You must be logged in to view this page."
   end
  end
end
