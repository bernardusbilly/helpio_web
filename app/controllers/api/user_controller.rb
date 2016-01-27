class Api::UserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @user = User.all()
    respond_to do |format|
      format.json { render :json => @user }
    end
  end

  def show
    @user = User.all
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(user_params)
    @user.uid = SecureRandom.uuid
    respond_to do |format|
      if @user.save
        @user_ret = @user.attributes
        session[:uid] = @user.id
        ['created_at', 'updated_at', 'encrypted_password', 'password_hash', 'password_salt'].each { |k| @user_ret.delete k }
        format.json { render json: @user_ret, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def prof_img
    @user = User.find(current_user.id)
    @user.uploaded_file = params[:img]
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def pulse_info
    @message_id = Message.select("id").where("uid = ? OR suid = ?", current_user.id, current_user.id).map{ |x| [x.id] }.flatten
    @message_unread = MessageContent.where(:mid => @message_id).where(:read => nil).size
    threshold_time = DateTime.now.advance(:days => -1)
    @new_friends = Friend.where("uid = ? OR suid = ?", current_user.id, current_user.id).where("created_at >= ?", threshold_time).size
    respond_to do |format|
      format.json { render json: {unread_message: @message_unread, new_friend: @new_friends}, status: :created }
    end
  end

  def update_info
    @user = User.find(current_user.id)
    @user.update(update_params)
    respond_to do |format|
      format.json { render json: @user, status: :created }
    end
  end

  def test
    respond_to do |format|
      format.json { render json: {session_uid: session[:uid], ck: cookies[:uid]}, status: :created }
    end
  end

  def is_login
    respond_to do |format|
      if logged_in?
        format.json { render json: {logged_in: 1}, status: :created }
      else
        format.json { render json: {logged_in: 0}, status: :created }
      end
    end
  end

  def login
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:uid] = @user.id
      respond_to do |format|
        @user_ret = @user.attributes
        @user_ret['mood'] ||= ''
        ['encrypted_password', 'password_hash', 'password_salt'].each { |k| @user_ret.delete k }
        format.json { render json: @user_ret, status: :created }
      end
      # flash[:notice] = "You've been logged in."
      # session[:user_id] = @user.id
    else
      respond_to do |format|
        format.json { render json: {success: 0}, status: :created }
      end
      # flash[:alert] = "There was a problem logging you in."
      # redirect_to log_in_path
    end
  end

  def logout
    session[:uid] = nil
    respond_to do |format|
      format.json { render json: {success: 1}, status: :created }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :nickname, :birthday, :gender)
  end

  def update_params
    params.permit(:password, :nickname, :mood)
  end

end
  