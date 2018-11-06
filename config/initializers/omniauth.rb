opts = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.github_client_id, Rails.application.secrets.github_client_secret, opts
  provider :facebook, Rails.application.secrets.facebook_client_id, Rails.application.secrets.facebook_client_secret
end