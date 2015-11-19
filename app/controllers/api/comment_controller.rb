class Api::CommentController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @comment = Comment.all
    respond_to do |format|
      format.json { render :json => @comment }
    end
  end

  def show
    @comment = Comment.all
    respond_to do |format|
      format.json { render json: @comment }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.assign_attributes(uid: session[:uid])
    respond_to do |format|
      if @comment.save
        @pin = Pin.find(@comment.pin_id)
        if session[:uid] != @pin.uid
          @notification = Notification.create(uid: @pin.uid, suid: session[:uid], pin_id: @comment.pin_id, title: @pin.title, category: 2, read: 0)
        end
        format.json { render json: @comment, status: :created }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def liked
    status = params[:status]
    if status == "1"
      @comment_liked = CommentLike.new(liked_params)
      @comment_liked.assign_attributes(uid: session[:uid])
      respond_to do |format|
        if @comment_liked.save
          @comment = Comment.find(@comment_liked.comment_id)
          if session[:uid] != @comment.uid
            @notification = Notification.create(uid: @comment.uid, suid: session[:uid], pin_id: @comment.pin_id, comment_id: @comment.id, title: @comment.content, category: 3, read: 0)
          end  
          format.json { render json: @comment_liked, status: :created }
        else
          format.json { render json: @comment_liked.errors, status: :unprocessable_entity }
        end
      end
    else
      @comment_liked = CommentLike.where(comment_id: params[:comment_id], uid: session[:uid])
      respond_to do |format|
        if @comment_liked.destroy_all
          @notification = Notification.where(suid: session[:uid], comment_id: comment_liked.comment_id)
          @notification.destroy_all
          format.json { render json: @comment_liked, status: :accepted }
        else
          format.json { render json: @comment_liked.errors, status: :unprocessable_entity }
        end  
      end
    end
  end

  private

  def comment_params
    params.permit(:pin_id, :content)
  end

  def liked_params
    params.permit(:comment_id)
  end

end
