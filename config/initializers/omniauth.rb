Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['AJ_GOOGLE_CLIENT_ID'],
           ENV['AJ_GOOGLE_CLIENT_SECRET'],
           scope: 'email',
           prompt: 'select_account'
end
