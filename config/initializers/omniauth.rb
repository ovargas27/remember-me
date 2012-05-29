Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '453741213973.apps.googleusercontent.com', '7N70IWzSgNoqfnSZ6pNfRzPC'
end
