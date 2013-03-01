require 'spec_helper'

describe Apigee do
  after do
    Apigee.reset
  end

  describe '.respond_to?' do
    it 'takes an optional include private argument' do
      Apigee.respond_to?(:client, true).should be_true
    end
  end

  describe ".client" do
    it "should be a Apigee::Client" do
      Apigee.client.should be_a Apigee::Client
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      Apigee.adapter.should == Apigee::Configuration::DEFAULT_ADAPTER
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      Apigee.adapter = :typhoeus
      Apigee.adapter.should == :typhoeus
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      Apigee.endpoint.should == Apigee::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      Apigee.endpoint = 'http://tumblr.com/'
      Apigee.endpoint.should == 'http://tumblr.com/'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      Apigee.user_agent.should == Apigee::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      Apigee.user_agent = 'Custom User Agent'
      Apigee.user_agent.should == 'Custom User Agent'
    end
  end

  describe ".version" do
    it "should return the default version" do
      Apigee.version.should == Apigee::Configuration::DEFAULT_VERSION
    end
  end

  describe ".version=" do
    it "should set the user_agent" do
      Apigee.version = '2'
      Apigee.version.should == '2'
    end
  end

  describe ".configure" do

    Apigee::Configuration::VALID_OPTIONS_KEYS.each do |key|

      it "should set the #{key}" do
        Apigee.configure do |config|
          config.send("#{key}=", key)
          Apigee.send(key).should == key
        end
      end
    end
  end

end