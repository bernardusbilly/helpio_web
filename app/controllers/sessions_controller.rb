class SessionsController < ApplicationController
	def index
	end

	def index2
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to index2_path
	end

	def destroy
		session[:user_id] = nil
	end
end
