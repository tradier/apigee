require 'spec_helper'

describe Apigee::API::Companies do
  before(:each) do
    @client = Apigee::Client.new(:username => 'sjobs', :password => 'iphone', :organization => 'apple')
  end

  describe '.companies' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies").
         to_return(:status => 200, :body => fixture("companies.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.companies
      @req.should have_been_made
    end

    it "returns the list of companies" do
      companies = @client.companies
      companies.should be_an(Array)
      companies.first.should eq('DevCompany')
    end
  end

  describe '.create_company' do
    before(:each) do
      @req = stub_request(:post, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies").
         to_return(:status => 200, :body => fixture("company.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.create_company(:name => 'MyCo', :displayName => 'My Company', :status => 'active')
      @req.should have_been_made
    end

    it "returns the company" do
      company = @client.create_company(:name => 'MyCo', :displayName => 'My Company', :status => 'active')
      company['name'].should eq('MyCo')
    end
  end

  describe '.update_company' do
    before(:each) do
      @req = stub_request(:post, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/myco").
         to_return(:status => 200, :body => fixture("company.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.update_company('myco', :status => 'inactive')
      @req.should have_been_made
    end

    it "returns the company" do
      company = @client.update_company('myco', :status => 'inactive')
      company['status'].should eq('inactive')
    end
  end

  describe '.delete_company' do
    before(:each) do
      @req = stub_request(:delete, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/myco").
         to_return(:status => 200, :body => fixture("company.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.delete_company('myco')
      @req.should have_been_made
    end

    it "returns the company" do
      company = @client.delete_company('myco')
      company['name'].should eq('MyCo')
    end
  end

  describe '.company' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/myco").
         to_return(:status => 200, :body => fixture("company.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.company('myco')
      @req.should have_been_made
    end

    it "returns the company" do
      company = @client.company('myco')
      company['name'].should eq('MyCo')
    end
  end

  describe '.company_appfamilies' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/companies/myco/appfamilies").
         to_return(:status => 200, :body => fixture("company_app_families.json"), :headers => {})
    end

    it "gets the correct resource" do
      @client.company_appfamilies('myco')
      @req.should have_been_made
    end

    it "returns the list of families" do
      families = @client.company_appfamilies('myco')
      families.should be_an(Array)
      families.should be_empty
    end
  end
end
