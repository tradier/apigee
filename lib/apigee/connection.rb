require 'faraday'
require 'multi_json'
require 'faraday_middleware'

module Apigee
  # @private
  module Connection
    private

    def connection(raw=false)
      merged_options = connection_options.merge({
        :headers => {
          'Accept' => "application/json",
          'User-Agent' => user_agent
        },
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => endpoint
      })

      Faraday.new(merged_options) do |builder|
        builder.use Faraday::Request::BasicAuthentication, username, password
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Rashify unless raw
        builder.use Faraday::Response::ParseJson unless raw
        builder.adapter(adapter)
      end
    end
  end
end