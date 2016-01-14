class Users::SessionsController < DeviseTokenAuth::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end


  def resource_params
    super
    params.require(:user).permit(:email, :password, :user, :authenticity_token, :utf8, :commit)
  end

  def render_create_success
    render 'sessions/profile'
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
