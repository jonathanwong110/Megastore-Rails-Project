class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
    else
      redirect_to new_user_path
    end
    session[:user_id] = @user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    if session[:user_id] = @user.id
      session.delete :user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password_digest, :store)
  end

end
