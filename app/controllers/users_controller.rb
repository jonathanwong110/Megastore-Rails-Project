class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @products = Product.where(user_id: @user)
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
      flash[:notice] = "Registration was successful!"
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
    @user.update(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "Profile was updated successfully!"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if session[:user_id] == @user.id
      session.delete :user
      flash[:notice] = "User was deleted successfully!"
      render :/
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_login
    unless logged_in?
        render :new
    end
  end

end
