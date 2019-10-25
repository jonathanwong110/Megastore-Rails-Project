class CartsController < ApplicationController
  before_action :require_login

  def index
    @cart = Cart.where(user_id: current_user.id)
    @product = Product.find(params[:id])
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @product = Product.find(params[:id])
    @cart.products << @product
    if @cart.update(cart_params)
      @cart.save
    end
    redirect_to carts_path(@cart)
  end

  def destroy
    @cart.clear
    redirect_to root_url
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end

end
