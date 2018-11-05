Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'f29a834ca18525f619aa', '9ee6729f97a1a237a1b5fdba29e725715c91754f'
end