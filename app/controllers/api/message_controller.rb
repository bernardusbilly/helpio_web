class Api::MessageController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    exclude_list = JSON.parse(params[:exclude_id] || "[]")
    if exclude_list.count > 1
      @messages = Message.where("(uid = ? OR suid = ?) AND id NOT IN (?)", current_user.id, current_user.id, exclude_list)
    else
      @messages = Message.where("uid = ? OR suid = ?", current_user.id, current_user.id)
    end

    @messages.each do |message|
      if message.uid == current_user.id
        suid = message.suid
      else
        suid = message.uid
      end
      user = User.find(suid)
      message.nickname = user.nickname
      message.prof_img = user.prof_img
      @content = MessageContent.where(mid: message.id).order("created_at").last
      if @content
        message.last_text = @content.text
      end
    end
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

  def roomid
    @message = Message.where("uid = ? AND suid = ? OR uid = ? AND suid = ?", current_user.id, params[:suid], params[:suid], current_user.id).first
    respond_to do |format|
      if @message
        format.json { render json: {roomid: @message.id}, status: :created }
      else
        @message = Message.new(uid: current_user.id, suid: params[:suid])
        if @message.save
          format.json { render json: {roomid: @message.id}, status: :unprocessable_entity }
        else
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
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
    @message_contents = MessageContent.where('mid = ? AND id >= ?', params[:mid], params[:last_id] || 0)
    @message_contents.each do |content|
      if content.uid == current_user.id
        content.self_msg = true
      else
        content.self_msg = false
      end
    end
    respond_to do |format|
      format.json { render :json => @message_contents }
    end
  end

  private

  def message_params
    params.permit(:suid)
  end

  def send_params
    params.permit(:mid, :text)
  end

end
