require "rubygems"
require "bundler/setup"

# require your gems as usual
require "apigee"

puts Apigee::VERSION

Apigee.configure do |config|
  config.username = 'jbarry@tradier.com'
  config.password = '%Elias01'
  config.organization = 'tradier'
end

puts Apigee.access_tokens.inspect