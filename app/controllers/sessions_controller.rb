class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      render :new
    end
  end
  
  def destroy
    if session[:user_id] == current_user.id
      session.clear
      redirect_to root_url
    end
  end
end
