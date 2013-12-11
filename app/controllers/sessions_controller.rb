class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      print "got this far"
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Check your email and password combination.'
      render 'new'
    end
  end

  def destroy
  end
end