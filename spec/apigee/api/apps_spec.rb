require 'spec_helper'

describe Apigee::API::Apps do
  before(:each) do
    @client = Apigee::Client.new(:username => 'sjobs', :password => 'iphone', :organization => 'apple')
  end

  describe '.apps' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/apps").
         to_return(:status => 200, :body => fixture("apps.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.apps
      @req.should have_been_made
    end

    it "should return the number of access tokens" do
      apps = @client.apps
      apps.should be_an(Array)
      apps.first.should eq('7b3ec66d-de8b-4ab5-8025-d949285bed4f')
    end
  end

  describe '.app_by_id' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/apps/72d0da6a-6441-48d8-98af-1da6187d0adc").
         to_return(:status => 200, :body => fixture("app.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.app_by_id('72d0da6a-6441-48d8-98af-1da6187d0adc')
      @req.should have_been_made
    end

    it 'returns an array of apps' do
      apps = @client.app_by_id('72d0da6a-6441-48d8-98af-1da6187d0adc')
      apps.should be_a(Hash)
      apps['callbackUrl'].should eq('login.myapp.com')
    end

    it 'is aliased as .app' do
      @client.app('72d0da6a-6441-48d8-98af-1da6187d0adc')
      @req.should have_been_made
    end
  end

  describe 'apps_by_family' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/apps?appfamily=myApps").
         to_return(:status => 200, :body => fixture("apps_by_family.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.apps_by_family('myApps')
      @req.should have_been_made
    end

    it 'returns an array of apps' do
      apps = @client.apps_by_family('myApps')
      apps.should be_an(Array)
      apps.first.should eq('app2.1')
    end
  end

  describe '.apps_by_status' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/apps?status=approved").
         to_return(:status => 200, :body => fixture("apps_by_status.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.apps_by_status('approved')
      @req.should have_been_made
    end

    it 'returns an array of apps' do
      apps = @client.apps_by_status('approved')
      apps.should be_an(Array)
      apps.first.should eq('app2.1')
    end
  end

  describe '.apps_by_type' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/apps?apptype=developer").
         to_return(:status => 200, :body => fixture("apps_by_type.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.apps_by_type('developer')
      @req.should have_been_made
    end

    it 'returns an array of apps' do
      apps = @client.apps_by_type('developer')
      apps.should be_an(Array)
      apps.first.should eq('app1.1')
    end
  end

  describe '.app_by_creation_date' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/apps?createdat=1342265464016").
         to_return(:status => 200, :body => fixture("apps_by_creation_date.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.apps_by_creation_date(1342265464016)
      @req.should have_been_made
    end

    it 'returns an array of apps' do
      apps = @client.apps_by_creation_date(1342265464016)
      apps.should be_an(Array)
      apps.first.should eq('app2.1')
    end

    it 'accepts a Time object' do
      t = Time.now
      t.stub(:to_i).and_return(1342265464016)

      apps = @client.apps_by_creation_date(t)
      @req.should have_been_made
    end
  end
end
