class ReviewsController < ApplicationController
  before_action :require_login
  
  def new
    @review = Review.new
    @review.user_id = current_user.id
    @product = Product.find(params[:product_id])
    if !@product.review_ids.include?(current_user.id)
    else
      redirect_to user_product_path(@product.user_id, @product.id)
      flash[:notice] = "*You've already written a review for this product!*"
    end 
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to user_product_path(@review.product.user, @review.product_id)
      flash[:notice] = "*The review was posted!*"
    else
      @product = Product.find(params[:review][:product_id])
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    redirect_if_not_reviewer
  end

  def update
    @review = Review.find(params[:id])
    @product = Review.find_by(product_id: current_user.id)
    redirect_if_not_reviewer
    if @review.update(review_params)
      redirect_to user_product_path(@review.product.user, @review.product_id)
      flash[:notice] = "*The review was updated successfully!*"
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product = Review.find_by(product_id: current_user.id)
    redirect_if_not_reviewer
    @review.destroy
    redirect_to user_product_path(@review.product.user, @review.product_id)
    flash[:notice] = "*The review was deleted!*"
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :product_id)
  end

  def redirect_if_not_reviewer
    if @review.user_id != current_user.id
      redirect_back(fallback_location: root_path)
    end
  end

end
