class SessionsController < ApplicationController
  
  def create
    if auth != nil
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['nickname']
        u.email = auth['info']['email']
        u.password = '12345'
        u.uid = auth['uid']
      end
      session[:user_id] = @user.id
      Cart.find_or_create_by(user_id: @user.id)
      redirect_to users_path
    else
      @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to users_path
      else
        flash[:error] = "Incorrect username and/or password. Please try again"
        render :new
      end
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end

end
