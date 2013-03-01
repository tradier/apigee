require 'faraday'
require 'multi_json'
require 'apigee/connection'
require 'apigee/api/oauth2'

module Apigee
  class Client
    include Apigee::Connection
    include Apigee::API::Oauth2

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Apigee.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    # Perform an HTTP DELETE request
    def delete(path, params={})
      request(:delete, path, params)
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params={})
      request(:post, path, params, signature_params)
    end

    # Perform an HTTP PUT request
    def put(path, params={})
      request(:put, path, params)
    end

  private

    # Perform an HTTP request
    def request(method, path, options, raw=false)
      response = connection(raw).send(method) do |request|
        request.path = path_prefix + organization + path
        request.body = options unless options.empty?
      end
      raw ? response : response.body
    end

  end
end