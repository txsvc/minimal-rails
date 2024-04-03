# typed: strict
# frozen_string_literal: true

class AuthenticationService
  include Backend::RestApi

  # migrate to https://github.com/jnunemaker/httparty ?

  @project_id = ENV.fetch('PROJECT_ID', 'default')
  @api_endpoint = ENV.fetch('API_ENDPOINT', 'http://localhost:8080')
  @api_key = ENV.fetch('RAILS_MASTER_KEY', nil)

  def self.update
  rescue StandardError
  end

  def self.register_client(auth)
    response = Backend::RestApi.post("#{@api_endpoint}/a/v1/auth/new", auth.attributes, @api_key)

    return nil unless response.code == '201'

    auth = JSON.parse(response.body)
    auth = nil if auth.empty?
    auth
  rescue StandardError
    nil
  end

  def self.lookup_by_token(_token)
  rescue StandardError
  end
end
