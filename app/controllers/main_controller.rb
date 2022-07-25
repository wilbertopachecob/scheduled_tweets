class MainController < ApplicationController
    def index
        # flash.now[:notice]="My first flash" 
        # flash.now[:alert]="My second flash"
        
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end 
    end    
end