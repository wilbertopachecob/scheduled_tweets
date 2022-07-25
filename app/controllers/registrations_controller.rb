class RegistrationsController < ApplicationController
   def new
      @user = User.new 
      # @errors = ["Pepe"]
   end 

   def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id
         redirect_to root_path, notice: "Successfully created account"
      else
         # flash[:alert] = "Something went wrong"
         # logger.debug @user.errors.inspect
         # logger.debug @user.errors.full_messages.inspect
         @errors = @user.errors.full_messages
         logger.debug @errors.inspect
         render :new
         # render :new, locals: { errors: "123"}
         # render :template => "registrations/new", :locals => { :errors => "123"}
         # render :template => "registrations/new"
         # redirect_to root_path, notice: "Successfully created account"
      end   
   end 
   
   private
   
   def user_params
      params.require(:user).permit(:email, :password, :password_confirmation) 
   end 
end