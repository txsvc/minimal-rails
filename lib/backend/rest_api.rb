# frozen_string_literal: true

module Backend
  module RestApi
    def self.get(endpoint, token = nil, timeout = 60)
      uri = URI(endpoint)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if Rails.env.production?

      request = Net::HTTP::Get.new(uri)
      http.read_timeout = timeout
      request['Authorization'] = "Bearer #{token}" unless token.nil?

      http.request(request)
    end

    def self.post(endpoint, payload = nil, token = nil, timeout = 60)
      uri = URI(endpoint)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if Rails.env.production?

      request = Net::HTTP::Post.new(uri)
      http.read_timeout = timeout
      request['Content-Type'] = 'application/json'
      request['Authorization'] = "Bearer #{token}" unless token.nil?
      request.body = payload.to_json unless payload.nil?

      http.request(request)
    end

    def self.delete(endpoint, token = nil, timeout = 60)
      uri = URI(endpoint)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if Rails.env.production?

      request = Net::HTTP::Delete.new(uri)
      http.read_timeout = timeout
      request['Authorization'] = "Bearer #{token}" unless token.nil?

      http.request(request)
    end
  end
end
