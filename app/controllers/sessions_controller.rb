class SessionsController < ApplicationController
  
  def new
  end

  def create
    @customer = Customer.find_by(username: params[:customer][:username])
    @store = Store.find_by(username: params[:store][:username])
    if @customer.authenticate(params[:customer][:password])
      session[:user_id] = @customer.id
      redirect_to customers_path
    elsif !@customer.authenticate(params[:customer][:password])
      redirect_to new_customer_path
    elsif @store.authenticate(params[:store][:password])
      session[:user_id] = @store.id
      redirect_to stores_path
    elsif !@store.authenticate(params[:store][:password])
      redirect_to new_store_path
    else
      redirect_to root_url
    end
  end
  
  def destroy
    if session[:username] = params[:username]
      session.delete :username
    end
  end
end
