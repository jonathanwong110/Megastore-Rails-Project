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
      render :new
    end
  end

end
