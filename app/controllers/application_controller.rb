class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in?
    !!session[:user_id]
  end
  
  def current_user
    User.find(session[:user_id])
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "*Please log in to view information!*"
      redirect_to login_path
    end
  end

end
