class ProductsController < ApplicationController
  before_action :set_product!, only [:show, :edit, :update]
  
  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params)
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.valid?
      @product.save
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(product).permit(:title, :price, :description, :category, :store_id)
  end

  def set_product!
    @product = Product.find(params[:id])
  end

end
