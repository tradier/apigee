# encoding: utf-8
unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_group 'Apigee', 'lib/apigee'
    add_group 'Specs', 'spec'
    add_filter '.bundle'
  end
end

require 'apigee'
require 'rspec'
