class CartproductsController < ApplicationController
  before_action :require_login
  
    def destroy
        @product = Product.find(params[:id])
        @cart = Cart.find_by(user_id: current_user.id)
        if @cart.products.delete(@product)
          flash[:notice] = "Product was removed from the cart successfully"
        end
        redirect_to cart_path
      end
end
