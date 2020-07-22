class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in?
    !!session[:user_id]
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "*Please log in to view information!*"
      redirect_to login_path
    end
  end

end
