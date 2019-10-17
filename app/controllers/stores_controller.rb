class StoresController < ApplicationController
  
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
  end

  private

  def store_params
    params.require(:store).permit(:username, :email, :password_digest)
  end

end
