Rails.application.config.middleware.use OmniAuth::Builder do
	# TODO secure API key somewhere
  provider :google_oauth2, '769379556229-2q53l9l2lfaotgil2ogd1nioebeg5par.apps.googleusercontent.com', '49zz30qe3sOOjrEjuDtvkgVq'
  provider :facebook, '550729988414123', '98f3322027f380f8f1e53f76a0417c77'
end