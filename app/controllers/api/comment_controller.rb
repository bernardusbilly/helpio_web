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

  private

   def comment_params
        params.permit(:pin_id, :uid, :content)
   end

end
