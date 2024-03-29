class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	helper_method :current_user, :logged_in?

  def current_user
		@current_user ||= User.find(session[:uid]) if session[:uid]
	end
	def logged_in?
		current_user != nil
	end
end
