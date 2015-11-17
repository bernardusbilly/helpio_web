class Api::NotificationController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @notification = Notification.order('id desc').where(uid: session[:uid])
	@notification.each do |notification|
	  user = User.find(notification.suid)
	  pin = Pin.find(notification.pin_id)
	  notification.nickname = user.nickname
	  notification.prof_img = user.prof_img
	  notification.lat = pin.lat
	  notification.lon = pin.lon
      notification.comment_count = pin.comment.count
      notification.like_count = pin.pin_like.count
      notification.liked = pin.pin_like.where(uid: session[:uid]).count
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
