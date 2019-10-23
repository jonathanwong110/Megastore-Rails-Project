class CartsController < ApplicationController

  def index
    @cart = current_cart
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      @cart.save
    end
    redirect_to carts_path(@cart)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.clear
  end
  
  def add_to_cart
    current_cart.add_product(params[:product_id])
  end

end
