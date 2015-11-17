class Api::NotificationController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @notification = Notification.order('id desc').where(uid: session[:uid])
	@notification.each do |notification|
	  user = User.find(notification.suid)
	  notification.nickname = user.nickname
	  notification.prof_img = user.prof_img
	end
    respond_to do |format|
      format.json { render :json => @notification }
    end
  end

  def show
    @notification = Notification.where(uid: session[:uid])
    respond_to do |format|
      format.json { render json: @notification }
    end
  end
end
