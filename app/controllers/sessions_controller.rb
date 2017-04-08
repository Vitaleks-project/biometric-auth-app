class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def new
    super
  end

  def create
    if params[:user].present?
      @user = User.find_for_database_authentication(email: params[:user][:email])
      if @user
        redirect_to new_pin_codes_path
      else
        failure
      end
    end
  end

  private

  def failure
    warden.custom_failure!
    render json: "Email or Password is invalid", status: 422
  end
end