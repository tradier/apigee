require 'apigee/connection'
require 'apigee/api/apis'
require 'apigee/api/apps'
require 'apigee/api/analytics'
require 'apigee/api/developers'
require 'apigee/api/developer_apps'
require 'apigee/api/companies'
require 'apigee/api/company_apps'
require 'apigee/api/oauth2'
require 'apigee/api/products'


module Apigee
  class Client
    include Apigee::Connection
    include Apigee::API::Apis
    include Apigee::API::Apps
    include Apigee::API::Analytics
    include Apigee::API::Developers
    include Apigee::API::DeveloperApps
    include Apigee::API::Companies
    include Apigee::API::CompanyApps
    include Apigee::API::Oauth2
    include Apigee::API::Products

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
      request(:post, path, params)
    end

    # Perform an HTTP PUT request
    def put(path, params={})
      request(:put, path, params)
    end

    private

    # Perform an HTTP request
    def request(method, path, params, raw=false)
      url = path_prefix + organization + path
      response = connection(raw).send(method, url, params)
      raw ? response : response.body
    end

  end
end
