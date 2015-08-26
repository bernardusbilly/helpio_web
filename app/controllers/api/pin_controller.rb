class Api::PinController < ApplicationController
  protect_from_forgery :except => :create 
  
  def index
    @pin = Pin.all
    respond_to do |format|
      format.json { render :json => @pin }
    end
  end

  def show
    @pin = Pin.all
    respond_to do |format|
      format.json { render json: @pin }
    end
  end

  def create
    @pin = Pin.new(pin_params)
    respond_to do |format|
      if @pin.save
        format.json { render json: @pin, status: :created }
      else
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  private

   def pin_params
        params.permit(:uid, :title, :lon, :lat)
   end

end
