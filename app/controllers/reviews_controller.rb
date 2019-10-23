class ReviewsController < ApplicationController
  def index
  end

  def show
    @review = @Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review(review_params)
    if @review.valid?
      @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.valid?
      @review.save
      redirect_to reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user == @review.user_id
      @review.destroy
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :product_id)
  end

end
