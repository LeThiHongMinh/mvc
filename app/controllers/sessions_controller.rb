class SessionsController < ApplicationController
    def new 
    end 

    def create 
        if user = User.find_by_name(params[:name])
            login user
            redirect_to root_path, notice: "You have signed successfully"
        else 
            flash[:alert] = "Invalid username"
            render :new, status: :unprocessable_entity
        end 
    end

    def destroy 
        logout
        redirect_to root_path, notice: "You have been logged out"
    end
end