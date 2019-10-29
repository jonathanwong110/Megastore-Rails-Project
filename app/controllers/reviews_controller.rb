class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @product = Review.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to reviews_path
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
    if @review.update(review_params)
      @review.save
      redirect_to product_path(@review.product_id)
      flash[:notice] = "Review was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user.id == @review.user_id
      @review.destroy
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
