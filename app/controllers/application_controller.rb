class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Add admin helper method
  helper_method :admin?
  protected

  def admin?
  	false
  end
end
