class UsersController < ApplicationController
  
  def show
  	@user = User.find_by_name(params[:name])
  end

  def new
      @user = User.new
  end

 def create
     @user = User.new(user_params)
     if @user.save
       flash.now[:success] = "Welcome to The Resplendent."
       redirect_to "/"
     else
       render 'new'
     end
   end


 private

   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end
