class UsersController < ApplicationController

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
    @users = User.paginate(:page => params[:page], :per_page => 20)
  end

  private

    def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
