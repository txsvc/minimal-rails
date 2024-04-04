# typed: strict
# frozen_string_literal: true

class AuthenticationService
  include Backend::RestApi

  # migrate to https://github.com/jnunemaker/httparty ?

  # access the backend API
  @api_key = ENV.fetch('RAILS_MASTER_KEY', nil)
  @api_endpoint = ENV.fetch('API_ENDPOINT', 'http://localhost:8080')

  # other ENVs needed for the API client
  @project_id = ENV.fetch('PROJECT_ID', 'default')

  # POST /a/v1/auth/new
  def self.register_client(auth)
    response = Backend::RestApi.post("#{@api_endpoint}/a/v1/auth/new", auth.attributes, @api_key)

    return nil unless response.code == '201'

    auth = JSON.parse(response.body)
    auth = nil if auth.empty?
    auth
  rescue StandardError
    nil
  end

  # DELETE /a/v1/auth/:client_id
  def self.revoke_client(email)
    client_id = "#{@project_id}.#{email}"
    response = Backend::RestApi.delete("#{@api_endpoint}/a/v1/auth/#{client_id}", @api_key)

    return false unless response.code == '200'

    true
  rescue StandardError
    false
  end

  def self.lookup_by_token(_token)
  rescue StandardError
  end
end
