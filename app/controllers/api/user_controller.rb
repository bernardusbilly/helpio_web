class Api::UserController < ApplicationController
  protect_from_forgery :except => :create 
  
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
    respond_to do |format|
      if @user.save
        @user_ret = @user.attributes
        session[:uid] = @user.id
        ['created_at', 'updated_at', 'password_hash', 'password_salt'].each { |k| @user_ret.delete k }
        format.json { render json: @user_ret, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
        ['password_hash', 'password_salt'].each { |k| @user_ret.delete k }
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

end
  