class Api::NotificationController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @notification = Notification.order('id desc').where(uid: current_user.id)
	@notification.each do |notification|
	  user = User.find(notification.suid)
	  pin = Pin.find(notification.pin_id)
	  notification.nickname = user.nickname
	  notification.prof_img = user.prof_img
	  notification.lat = pin.lat
	  notification.lon = pin.lon
      notification.comment_count = pin.comment.count
      notification.like_count = pin.pin_like.count
      notification.liked = pin.pin_like.where(uid: current_user.id).count
	end
    respond_to do |format|
      format.json { render :json => @notification }
    end
  end

  def show
    @notification = Notification.where(uid: current_user.id)
    respond_to do |format|
      format.json { render json: @notification }
    end
  end
end
