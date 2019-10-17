class ApplicationController < ActionController::Base

    def current_user
        !!session[:customer_id] || !!session[:store_id]
    end

    def require_login
        Customer.find(session[:customer_id]) || Store.find(session[:store_id])
    end

end
