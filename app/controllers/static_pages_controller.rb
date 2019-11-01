class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @product = Product.find_by(user_id: current_user.id)
    end
  end
end
