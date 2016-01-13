Rails.application.config.middleware.use OmniAuth::Builder do
	# TODO secure API key somewhere
  provider :google_oauth2, '769379556229-2q53l9l2lfaotgil2ogd1nioebeg5par.apps.googleusercontent.com', '49zz30qe3sOOjrEjuDtvkgVq', :callback_url => '/omniauth/google_oauth2/callback'
  provider :facebook, '807318016080580', '4edcce637943228fd4fdfa9e0ada0d8b', :info_fields => 'name,email,birthday,gender', :callback_url => '/omniauth/facebook/callback'
end