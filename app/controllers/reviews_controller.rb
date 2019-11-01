class ReviewsController < ApplicationController
  before_action :require_login
  
  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?(review_params)
      @review.save
      redirect_to user_product_path(@review.product.user, @review.product_id)
      flash[:notice] = "Review was posted!"
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @product = Review.find_by(product_id: current_user.id)
    if @review.update(review_params)
      @review.save
      redirect_to user_product_path(@review.product.user, @review.product_id)
      flash[:notice] = "Review was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product = Review.find_by(product_id: current_user.id)
    if current_user.id == @review.user_id
      @review.destroy
      redirect_to user_product_path(@review.product.user, @review.product_id)
      flash[:notice] = "Review was deleted!"
    else
      render :destroy
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :product_id)
  end

end
