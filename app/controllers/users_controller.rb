class UsersController < ApplicationController
  
  before_filter :must_be_admin, only: :edit

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
      sign_in @user
      flash.now[:success] = "Welcome to The Resplendent."
      redirect_to @user
      else
        render 'new'
    end
  end

  def edit 
    
  end

  private

    def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def must_be_admin
      unless current_user && current_user.admin?
        redirect_to root_path
        flash.now[:error] = "You are not an admin. Please see the webmaster for permission."
      end
    end

end
