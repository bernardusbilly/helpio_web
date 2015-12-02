class Api::MessageController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @messages = Message.all

    respond_to do |format|
      format.json { render :json => @messages }
    end
  end

  def show
    @messages = Message.all

    respond_to do |format|
      format.json { render :json => @messages }
    end
  end

  def create
    @messages = Message.new(message_params)
    @messages.assign_attributes(uid: current_user.id)
    respond_to do |format|
      if @messages.save
        format.json { render json: @messages, status: :created }
      else
        format.json { render json: @messages.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_text
    @message_content = MessageContent.new(send_params)
    @message_content.assign_attributes(uid: current_user.id)
    respond_to do |format|
      if @message_content.save
        format.json { render json: @message_content, status: :created }
      else
        format.json { render json: @message_content.errors, status: :unprocessable_entity }
      end
    end
  end

  def content
    @message_contents = MessageContent.where(mid: params[:mid])
    respond_to do |format|
      format.json { render :json => @message_contents }
    end
  end

  private

  def message_params
    params.permit(:suid)
  end

  def send_params
    params.permit(:mid, :text, :suid)
  end

end
