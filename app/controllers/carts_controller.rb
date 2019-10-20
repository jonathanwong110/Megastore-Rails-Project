class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update_attributes(cart_params)
      @cart.save
    end
    redirect_to carts_path(@cart)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.clear
  end
end
