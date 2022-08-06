class PasswordResetsController < ApplicationController
    def new
        
    end

    def create
     @user = User.find(email: params[:email])
     
     if @user.present?
        # send email       
        PasswordMailer.with(user: @user).reset.deliver_later 
     end
     redirect_to root_path, notice: "If a user with that email was found, we have sent an email with a link to reset your password"
    end
end