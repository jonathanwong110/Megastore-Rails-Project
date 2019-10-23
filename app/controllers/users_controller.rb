class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]

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
      @cart = Cart.create!(user_id: @user.id)
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.valid?
      @user.update(user_params)
      redirect_to @user
    end
    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    if session[:user_id] = @user.id
      session.delete :user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :store)
  end

  def require_login
    unless logged_in?
        render :new
    end
  end

end
