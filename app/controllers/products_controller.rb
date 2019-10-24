class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = current_user.id
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to products_path
      flash[:notice] = "Product was created successfully!"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
      flash[:notice] = "Product was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if session[:user_id] == @product.user_id
      @product.destroy
      flash[:notice] = "Product was deleted successfully!"
      redirect_to products_path
    else
      render :destroy
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :category, :user_id)
  end

end
