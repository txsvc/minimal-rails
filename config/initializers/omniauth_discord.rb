# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET'] #, scope: 'email' DO NOT ADD A SCOPE !
end
