class CartproductsController < ApplicationController
  before_action :require_login
  
  def delete
    @product = Product.find(params[:id])
    @cart = Cart.find_by(user_id: current_user.id)
    @cartproduct = CartProduct.find_by(product_id: @product.id, cart_id: @cart.id)
    if @cartproduct.destroy
      redirect_to carts_path
      flash[:notice] = "*The product was removed from the cart successfully*"
    end
  end

end
