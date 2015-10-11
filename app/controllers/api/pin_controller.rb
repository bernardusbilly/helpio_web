class Api::PinController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @pins = Pin.all

    @pins.each do |pin|
      pin.comment_count = pin.comment.count
      pin.like_count = pin.pin_like.count
      pin.liked = pin.pin_like.where(uid: 1).count
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

  def liked
    status = params[:status]
    if status == "1"
      @pin_liked = PinLike.new(liked_params)
      respond_to do |format|
        if @pin_liked.save
          format.json { render json: @pin_liked, status: :created }
        else
          format.json { render json: @pin_liked.errors, status: :unprocessable_entity }
        end
      end
    else
      @pin_liked = PinLike.where(pin_id: params[:pin_id], uid: params[:uid])
      respond_to do |format|
        if @pin_liked.destroy_all
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
      comment.like_count = comment.comment_like.count
      comment.liked = comment.comment_like.where(uid: 1).count
    end

    respond_to do |format|
      format.json { render :json => @comment }
    end
  end

  private

  def pin_params
    params.permit(:uid, :title, :lon, :lat, :img)
  end

  def liked_params
    params.permit(:uid, :pin_id)
  end

end