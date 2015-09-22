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
    respond_to do |format|
      if @comment.save
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
      respond_to do |format|
        if @comment_liked.save
          format.json { render json: @comment_liked, status: :created }
        else
          format.json { render json: @comment_liked.errors, status: :unprocessable_entity }
        end
      end
    else
      @comment_liked = CommentLike.where(comment_id: params[:comment_id], uid: params[:uid])
      respond_to do |format|
        if @comment_liked.destroy_all
          format.json { render json: @comment_liked, status: :accepted }
        else
          format.json { render json: @comment_liked.errors, status: :unprocessable_entity }
        end  
      end
    end
  end

  private

  def comment_params
    params.permit(:pin_id, :uid, :content)
  end

  def liked_params
    params.permit(:uid, :comment_id)
  end

end
