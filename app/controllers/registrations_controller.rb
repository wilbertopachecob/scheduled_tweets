class RegistrationsController < ApplicationController
    def new
       @user = User.new 
    end    
    def new
       render plain: "Thanks!"
    end    
end