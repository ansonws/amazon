class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email params[:email]
        if user&.authenticate params[:password]
            session[:user_id] = user.id
            flash[:notice] = "Logging in"
            redirect_to root_path
        else 
            flash[:notice] = "Wrong email or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end
