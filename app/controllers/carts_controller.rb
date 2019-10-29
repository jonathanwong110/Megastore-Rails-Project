class CartsController < ApplicationController
  before_action :require_login

  def show
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    carthash = params[:cart]
    product_id = carthash[:product_id]
    @product = Product.find(product_id)
    @cart = Cart.find(params[:id])
    @cart.products << @product
    if @cart.update(cart_params)
      @cart.save
    end
    redirect_to carts_path
  end

  def destroy
    @cart = Cart.find_by(user_id: current_user.id)
    @cart.products.destroy_all
    redirect_to root_url
  end

  def delete
    @product = Product.find(params[:product_id])
    @cart = Cart.find_by(user_id: current_user.id)
    byebug
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
