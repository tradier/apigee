require 'spec_helper'

describe Apigee::API::CompanyApps do
  before(:each) do
    @client = Apigee::Client.new(:username => 'sjobs', :password => 'iphone', :organization => 'apple')
  end

  describe '.company_apps' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/MyCo/apps").
         to_return(:status => 200, :body => fixture("company_apps.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.company_apps(:company_name => 'MyCo')
      @req.should have_been_made
    end

    it "returns the list of apps" do
      apps = @client.company_apps(:company_name => 'MyCo')
      apps.should be_an(Array)
      apps.first.should eq('DevApp2')
    end
  end

  describe '.create_company_app' do
    before(:each) do
      @req = stub_request(:post, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/MyCo/apps").
         to_return(:status => 200, :body => fixture("company_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.create_company_app(:company_name => 'MyCo', :name => 'My App', :status => 'active')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.create_company_app(:company_name => 'MyCo', :name => 'My App', :status => 'active')
      app['name'].should eq('sandboxTestApp')
    end
  end

  describe '.update_company_app' do
    before(:each) do
      @req = stub_request(:post, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/MyCo/apps/MyApp").
         to_return(:status => 200, :body => fixture("company_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.update_company_app(:company_name => 'MyCo', :name => 'MyApp', :status => 'active')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.update_company_app(:company_name => 'MyCo', :name => 'MyApp', :status => 'active')
      app['name'].should eq('sandboxTestApp')
    end
  end

  describe '.delete_company' do
    before(:each) do
      @req = stub_request(:delete, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/MyCo/apps/MyApp").
         to_return(:status => 200, :body => fixture("company_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.delete_company_app(:company_name => 'MyCo', :name => 'MyApp')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.delete_company_app(:company_name => 'MyCo', :name => 'MyApp')
      app['name'].should eq('sandboxTestApp')
    end
  end

  describe '.company_app' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/MyCo/apps/MyApp").
         to_return(:status => 200, :body => fixture("company_app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.company_app(:company_name => 'MyCo', :name => 'MyApp')
      @req.should have_been_made
    end

    it "returns the app" do
      app = @client.company_app(:company_name => 'MyCo', :name => 'MyApp')
      app['name'].should eq('sandboxTestApp')
    end
  end
end
