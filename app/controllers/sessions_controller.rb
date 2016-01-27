class SessionsController < ApplicationController
	def index
	end

	def index2
		respond_to do |f|
    		f.js { render layout: false, content_type: 'text/javascript' }
    		f.html
    	end
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
