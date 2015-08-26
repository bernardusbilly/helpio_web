class Api::UserController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @user = User.all
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
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

   def user_params
        params.permit(:uid, :userid, :nickname)
   end

end
