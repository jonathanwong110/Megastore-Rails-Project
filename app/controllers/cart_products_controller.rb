class CartProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @cartproduct = CartProduct.new
  end

  def create
    @cartproduct = CartProduct.create!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cart_products_params
    params.require(:cart_products_params).permit(:cart_id, :product_id)
  end

end
