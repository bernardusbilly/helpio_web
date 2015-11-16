class Api::NotificationController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @notification = Notification.where(uid: session[:uid])
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
