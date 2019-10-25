class CartsController < ApplicationController
  before_action :require_login

  def index
    @cart = Cart.where(user_id: current_user.id)
    @cartproduct = CartProduct.where(cart_id: current_user.id)
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @product = Product.find(params[:id])
    @cart << @product
    if @cart.update(cart_params)
      @cart.save
    end
    redirect_to carts_path(@cart)
  end

  def destroy
    @cart = @current_cart
    @cart.clear
    redirect_to root_url
  end
  
  def add_to_cart
    @current_cart.add_product(params[:product_id])
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end

end
