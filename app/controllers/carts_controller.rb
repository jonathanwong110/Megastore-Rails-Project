class CartsController < ApplicationController
  before_action :require_login

  def index
    @cart = Cart.where(id: current_user.id)
    #byebug
    @cartproducts = CartProduct.where(cart_id: current_user.id)
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    carthash = params[:cart]
    product_id = carthash[:product_id]
    @product = Product.find(product_id)
    @cart = Cart.find(params[:id])
    #byebug
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

  def delete
    @product = Product.find(params[:product_id])
    @cart = Cart.find(params[:id])
    if @cart.products.delete(@product)
      flash[:notice] = "Product was removed from the cart successfully"
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end

  def current_cart
    @cart = Cart.where(user_id: current_user.id)
  end

end
