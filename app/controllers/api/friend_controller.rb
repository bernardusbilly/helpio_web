class Api::FriendController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @friends = Friend.where("uid = ? OR suid = ?", current_user.id, current_user.id)

    @friends.each do |friend|
      if friend.uid == current_user.id
        suid = friend.suid
      else
        suid = friend.uid
      end
      user = User.find(suid)
      friend.nickname = user.nickname
      friend.prof_img = user.prof_img
    end
    respond_to do |format|
      format.json { render :json => @friends }
    end
  end

  def show
    @messages = Message.all

    respond_to do |format|
      format.json { render :json => @messages }
    end
  end

  def create
    @friends = Friend.new(add_params)
    @friends.assign_attributes(uid: current_user.id)
    respond_to do |format|
      if @friends.save
        format.json { render json: @friends, status: :created }
      else
        format.json { render json: @friends.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @friends = Friend.where("uid = ? OR suid = ?", current_user.id, current_user.id).select(:uid, :suid)
    @users = User.where("id != (?) AND id NOT IN (?)", current_user.id, @friends.map {|i| i.uid == current_user.id ? i.suid : i.uid})
    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  private

  def add_params
    params.permit(:suid)
  end

end
