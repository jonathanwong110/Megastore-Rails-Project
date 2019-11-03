class ProductsController < ApplicationController
  before_action :require_login
  
  def index
    @user = User.find_by(id: current_user.id)
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart = current_user.cart
    @review = Review.new
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
    if @product.user_id != current_user.id
      redirect_to product_path(@product)
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      @product.save
      redirect_to @product
      flash[:notice] = "Product was updated successfully!"
    else
      render :edit
      flash[:error] = "Please check all fields to make sure they're filled."
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      @product.destroy
      flash[:notice] = "Product was deleted successfully!"
      redirect_to products_path
    else
      redirect_to root_url
    end
  end

  def reviewed
    @products = Product.reviewed.all.uniq
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :category, :user_id)
  end

end
