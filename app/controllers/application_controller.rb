class ApplicationController < ActionController::Base

    def current_user
        !!session[:user_id]
    end

    def require_login
        User.find(session[:user_id])
    end

end
