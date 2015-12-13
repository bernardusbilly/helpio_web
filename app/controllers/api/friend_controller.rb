class Api::FriendController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @friends = Friend.where("uid = ? OR suid = ?", current_user.id, current_user.id)
    @all = []

    threshold_time = DateTime.now.advance(:days => -1)
    @friends.each do |friend|
      if friend.uid == current_user.id
        suid = friend.suid
      else
        suid = friend.uid
      end
      user = User.find(suid)
      friend.nickname = user.nickname
      friend.prof_img = user.prof_img
      if friend.created_at >= threshold_time
        friend.is_new = true
        @all.push(friend)
      end
    end
    @friends = @friends.sort_by &:nickname
    @friends.delete_if { |x| x.created_at >= threshold_time }
    respond_to do |format|
      format.json { render :json => @all + @friends }
    end
  end

  def show
    @friends = Friend.all

    respond_to do |format|
      format.json { render :json => @friends }
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
    if @friends.empty?
      @users = User.where("id != (?)", current_user.id)
    else
      @users = User.where("id != (?) AND id NOT IN (?)", current_user.id, @friends.map {|i| i.uid == current_user.id ? i.suid : i.uid})
    end
    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  private

  def add_params
    params.permit(:suid)
  end

end
