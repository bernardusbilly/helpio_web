class Api::PinController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    session[:uid] = 1
    session[:uid] = cookies[:uid] if cookies[:uid]
    @pins = Pin.all

    @pins.each do |pin|
      user = User.find(pin.uid)
      pin.nickname = user.nickname
      pin.prof_img = user.prof_img
      pin.comment_count = pin.comment.count
      pin.like_count = pin.pin_like.count
      pin.liked = pin.pin_like.where(uid: current_user.id).count
    end
    respond_to do |format|
      format.json { render :json => @pins }
    end
  end

  def show
    @pin = Pin.all
    respond_to do |format|
      format.json { render json: @pin }
    end
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.assign_attributes(uid: current_user.id)
    if pin_params[:img]
      @pin.uploaded_file = pin_params[:img]
    end
    respond_to do |format|
      if @pin.save
        format.json { render json: @pin, status: :created }
      else
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def mine
    @pins = Pin.where(uid: current_user.id)
    @pins.each do |pin|
      pin.nickname = current_user.nickname
      pin.prof_img = current_user.prof_img
      pin.comment_count = pin.comment.count
      pin.like_count = pin.pin_like.count
      pin.liked = pin.pin_like.where(uid: current_user.id).count
    end
    respond_to do |format|
      format.json { render json: @pins }
    end
  end

  def liked
    status = params[:status]
    if status == "1"
      @pin_liked = PinLike.new(liked_params)
      @pin_liked.assign_attributes(uid: current_user.id)
      respond_to do |format|
        if @pin_liked.save
          @pin = Pin.find(@pin_liked.pin_id)
          if current_user.id != @pin.uid
            @notification = Notification.create(uid: @pin.uid, suid: current_user.id, pin_id: @pin.id, title: @pin.title, category: 3, read: 0)
          end
          format.json { render json: @pin_liked, status: :created }
        else
          format.json { render json: @pin_liked.errors, status: :unprocessable_entity }
        end
      end
    else
      @pin_liked = PinLike.where(pin_id: params[:pin_id], uid: current_user.id)
      respond_to do |format|
        if @pin_liked.destroy_all
          @notification = Notification.where(suid: current_user.id, pin_id: pin_liked.pin_id)
          @notification.destroy_all
          format.json { render json: @pin_liked, status: :accepted }
        else
          format.json { render json: @pin_liked.errors, status: :unprocessable_entity }
        end  
      end
    end
  end

  def comment
    @comment = Comment.where(pin_id: params[:id])
    @comment.each do |comment|
      user = User.find(comment.uid)
      comment.nickname = user.nickname
      comment.prof_img = user.prof_img
      comment.like_count = comment.comment_like.count
      comment.liked = comment.comment_like.where(uid: current_user.id).count
    end
    respond_to do |format|
      format.json { render :json => @comment }
    end
  end

  def check_expired
    current_time = DateTime.now.advance(:minutes => -30)
    @pin = Pin.where("created_at < ?", current_time)
    respond_to do |format|
      format.json { render :json => @pin }
    end
  end

  private

  def pin_params
    params.permit(:title, :lon, :lat, :img)
  end

  def liked_params
    params.permit(:pin_id)
  end

end
