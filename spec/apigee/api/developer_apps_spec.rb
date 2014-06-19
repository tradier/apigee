require 'spec_helper'

describe Apigee::API::DeveloperApps do
  before(:each) do
    @client = Apigee::Client.new(:username => 'sjobs', :password => 'iphone', :organization => 'apple')
  end

  describe '.developer_apps' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/sjobs@apple.com/apps").
         to_return(:status => 200, :body => fixture("developer_apps.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.developer_apps(:email => 'sjobs@apple.com')
      @req.should have_been_made
    end

    it "returns the list of apps" do
      apps = @client.developer_apps(:email => 'sjobs@apple.com')
      apps.should be_an(Array)
      apps.first.should eq('DevApp2')
    end
  end

  describe '.create_developer_app' do
    before(:each) do
      @req = stub_request(:post, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/sjobs@apple.com/apps").
         to_return(:status => 200, :body => fixture("developer_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.create_developer_app(:email => 'sjobs@apple.com', :name => 'My App', :status => 'active')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.create_developer_app(:email => 'sjobs@apple.com', :name => 'My App', :status => 'active')
      app['name'].should eq('sandboxTestApp')
    end
  end

  describe '.update_developer_app' do
    before(:each) do
      @req = stub_request(:put, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/sjobs@apple.com/apps/MyApp").
         to_return(:status => 200, :body => fixture("developer_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.update_developer_app(:email => 'sjobs@apple.com', :name => 'MyApp', :status => 'active')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.update_developer_app(:email => 'sjobs@apple.com', :name => 'MyApp', :status => 'active')
      app['name'].should eq('sandboxTestApp')
    end
  end

  describe '.delete_developer_app' do
    before(:each) do
      @req = stub_request(:delete, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/sjobs@apple.com/apps/MyApp").
         to_return(:status => 200, :body => fixture("developer_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.delete_developer_app(:email => 'sjobs@apple.com', :name => 'MyApp')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.delete_developer_app(:email => 'sjobs@apple.com', :name => 'MyApp')
      app['name'].should eq('sandboxTestApp')
    end
  end

  describe '.developer_app' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/sjobs@apple.com/apps/MyApp").
         to_return(:status => 200, :body => fixture("developer_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.developer_app(:email => 'sjobs@apple.com', :name => 'MyApp')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.developer_app(:email => 'sjobs@apple.com', :name => 'MyApp')
      app['name'].should eq('sandboxTestApp')
    end
  end
end
