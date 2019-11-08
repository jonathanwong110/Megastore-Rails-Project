class CartproductsController < ApplicationController
  before_action :require_login
  
  def destroy
    @product = Product.find(params[:id])
    @cart = Cart.find_by(user_id: current_user.id)
    @cartproduct = CartProduct.find_by(product_id: @product.id, cart_id: @cart.id)
    if @cartproduct.destroy
      flash[:notice] = "Product was removed from the cart successfully"
    end
    redirect_to cart_path
    end

end
