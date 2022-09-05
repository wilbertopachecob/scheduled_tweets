class PasswordResetsController < ApplicationController
    def new
        
    end

    def create
     @user = User.find_by(email: params[:email])
     
     if @user.present?
        # send email       
        PasswordMailer.with(user: @user).reset.deliver_later 
     end
     redirect_to root_path, notice: "If a user with that email was found, we have sent an email with a link to reset your password"
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: "Yor token has expired, please try again"
    # binding.irb
    end
    
    def update
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was reset correctly. Please sign in"
        else
            render :edit, status: 422    
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end