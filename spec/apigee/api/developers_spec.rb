require 'spec_helper'

describe Apigee::API::Developers do
  before(:each) do
    @client = Apigee::Client.new(:username => 'sjobs', :password => 'iphone', :organization => 'apple')
  end

  describe '.developers' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers").
        to_return(:status => 200, :body => fixture("developers.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.developers
      @req.should have_been_made
    end

    it "returns the list of developers" do
      companies = @client.developers
      companies.should be_an(Array)
      companies.first.should eq('sjobs@apple.com')
    end
  end

  describe '.create_developer' do
    before(:each) do
      @req = stub_request(:post, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers").
        to_return(:status => 200, :body => fixture("developer.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.create_developer(:email => 'ntesla@theramin.com', :firstName => 'Nikola', :lastName => 'Tesla', :status => 'active')
      @req.should have_been_made
    end

    it "returns the developer" do
      developer = @client.create_developer(:email => 'ntesla@theramin.com', :firstName => 'Nikola', :lastName => 'Tesla', :status => 'active')
      developer['email'].should eq('ntesla@theramin.com')
    end
  end

  describe '.update_developer' do
    before(:each) do
      @req = stub_request(:put, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/ntesla@theramin.com").
        to_return(:status => 200, :body => fixture("developer.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.update_developer('ntesla@theramin.com', :status => 'inactive')
      @req.should have_been_made
    end

    it "returns the developer" do
      developer = @client.update_developer('ntesla@theramin.com', :status => 'inactive')
      developer['status'].should eq('inactive')
    end
  end

  describe '.delete_developer' do
    before(:each) do
      @req = stub_request(:delete, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/ntesla@theramin.com").
        to_return(:status => 200, :body => fixture("developer.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.delete_developer('ntesla@theramin.com')
      @req.should have_been_made
    end

    it "returns the company" do
      developer = @client.delete_developer('ntesla@theramin.com')
      developer['email'].should eq('ntesla@theramin.com')
    end
  end

  describe '.developer' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/ntesla@theramin.com").
        to_return(:status => 200, :body => fixture("developer.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.developer('ntesla@theramin.com')
      @req.should have_been_made
    end

    it "returns the developer" do
      developer = @client.developer('ntesla@theramin.com')
      developer['email'].should eq('ntesla@theramin.com')
    end
  end

  describe '.developer_appfamilies' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/developers/ntesla@theramin.com/appfamilies").
         to_return(:status => 200, :body => fixture("developer_app_families.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.developer_appfamilies('ntesla@theramin.com')
      @req.should have_been_made
    end

    it "returns the list of families" do
      families = @client.developer_appfamilies('ntesla@theramin.com')
      families.should be_an(Array)
      families.should be_empty
    end
  end
end
