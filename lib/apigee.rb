require 'apigee/configuration'
require 'apigee/client'

module Apigee
  extend Configuration

  # Alias for Apigee::Client.new
  #
  # @return [Apigee::Client]
  def self.client(options={})
    Apigee::Client.new(options)
  end

  # Delegate to Apigee::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private = false)
    client.respond_to?(method, include_private) || super(method, include_private)
  end

  # Custom error class for rescuing from all Apigee errors
  class Error < StandardError; end
end
