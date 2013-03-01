require 'faraday_middleware'

module Apigee
  module Configuration
    # An array of valid keys in the options hash when configuring a {Apigee::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :username,
      :password,
      :organization,
      :endpoint,
      :proxy,
      :version,
      :path_prefix,
      :user_agent,
      :connection_options].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = :net_http

    # By default, don't set a username
    DEFAULT_USERNAME = nil

    # By default, don't set a password
    DEFAULT_PASSWORD = nil

    # By default, don't set an organization
    DEFAULT_ORGANIZATION = nil

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'https://api.enterprise.apigee.com/'.freeze

    # The version of the API.
    DEFAULT_VERSION = '1'

    # The path prefix first appended to the endpoint
    DEFAULT_PATH_PREFIX = 'v' + DEFAULT_VERSION + '/o/'

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Apigee Ruby Gem #{Apigee::VERSION}".freeze

    # Connection options to send the client
    DEFAULT_CONNECTION_OPTIONS = {}

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k) }
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.username           = DEFAULT_USERNAME
      self.password           = DEFAULT_PASSWORD
      self.organization       = DEFAULT_ORGANIZATION
      self.endpoint           = DEFAULT_ENDPOINT
      self.version            = DEFAULT_VERSION
      self.path_prefix        = DEFAULT_PATH_PREFIX
      self.proxy              = DEFAULT_PROXY
      self.user_agent         = DEFAULT_USER_AGENT
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self
    end
  end
end