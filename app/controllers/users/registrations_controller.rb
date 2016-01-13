class Users::RegistrationsController < DeviseTokenAuth::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super do |user|
      paramUser = params[:user]
      if (paramUser[:gender] == 'Male')
        user.gender = 0
      elsif (paramUser[:gender] == 'Female')
        user.gender = 1
      end
      user.nickname = paramUser[:nickname]
      user.birthday = paramUser[:birthday]
      user.save!
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def render_create_success
    render "sessions/index2"
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :gender, :nickname, :birthday, :user, :authenticity_token, :utf8, :commit)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #  devise_parameter_sanitizer.for(:sign_up) << :user
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
