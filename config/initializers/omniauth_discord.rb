# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  # , scope: 'email' DO NOT ADD A SCOPE !
  provider :discord, ENV.fetch('DISCORD_CLIENT_ID', nil), ENV.fetch('DISCORD_CLIENT_SECRET', nil)
end
