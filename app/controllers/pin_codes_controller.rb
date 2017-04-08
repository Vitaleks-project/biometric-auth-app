class PinCodesController < ApplicationController
  respond_to :html, :json

  def index

  end

  def new
    @pincode = Pin_code.new
  end

  def create
    if params["pin_code"]
      @pin = Pin_code.find_by_pincode(params["pin_code"]["pincode"])
      if @pin
        @user = User.find_by(deviceToken: @pin.deviceToken)
        sign_in @user

        flash[:success] = "Success login"
        redirect_to root_path
      else
        flash[:error] = "Pin invalid"
        redirect_to :back
      end
    end
  end

  def create_pin_code
    if params["pincode"]
      Pin_code.create(pincode: params["pincode"]["pin"], deviceToken: params["pincode"]["deviceToken"])
    end
  end
end