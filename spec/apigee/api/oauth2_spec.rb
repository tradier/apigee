require 'spec_helper'

describe Apigee::API::Oauth2 do
  before(:each) do
    @client = Apigee::Client.new(:username => 'sjobs', :password => 'iphone', :organization => 'apple')
  end

  describe '.access_token_count' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/accesstokens").
         to_return(:status => 200, :body => fixture("access_token_count.json"), :headers => {})
    end

    it "should get the correct resource" do
      @client.access_token_count
      @req.should have_been_made
    end

    it "should return the number of access tokens" do
      access_token_count = @client.access_token_count
      access_token_count.value.should be_a Integer
      access_token_count.value.should == 1400
    end
  end

  describe '.approve_access_token' do
    before(:each) do
      @token = 'ohai'
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/accesstokens/#{@token}?action=approve").
         to_return(:status => 204, :headers => {})
    end

    it "should get the correct resource" do
      @client.approve_access_token(@token)
      @req.should have_been_made
    end
  end

  describe '.revoke_access_token' do
    before(:each) do
      @token = 'ohai'
      @req = stub_request(:post, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/accesstokens/#{@token}?action=revoke").
         to_return(:status => 204, :headers => {})
    end

    it "should get the correct resource" do
      @client.revoke_access_token(@token)
      @req.should have_been_made
    end
  end

  describe '.access_token' do
    before(:each) do
      @token = '25poPXCPOw43s0hJBn6tQYnUb5KF'
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/accesstokens/#{@token}").
         to_return(:status => 200, :body => fixture("access_token.json"), :headers => {})
    end

    it "should get the correct resource" do
      @client.access_token(@token)
      @req.should have_been_made
    end

    it "should return the same access token" do
      token = @client.access_token(@token)
      token.token.should == @token
    end
  end

  describe '.delete_access_token' do
    before(:each) do
      @token = 'taFM3LHUTQAFhL0dIFg81XhRc7vC'
      @req = stub_request(:delete, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/accesstokens/#{@token}").
         to_return(:status => 200, :body => fixture("delete_access_token.json"), :headers => {})
    end

    it "should get the correct resource" do
      @client.delete_access_token(@token)
      @req.should have_been_made
    end

    it "should return the same access token" do
      token = @client.delete_access_token(@token)
      token.token.should == @token
    end
  end

  describe '.update_access_token' do
    before(:each) do
      @token = 'taFM3LHUTQAFhL0dIFg81XhRc7vC'
      @req = stub_request(:put, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/accesstokens/#{@token}").
         to_return(:status => 200, :body => fixture("update_access_token.json"), :headers => {})
    end

    it "should get the correct resource" do
      @client.update_access_token(@token, {:att_n1 => 'att_v1'})
      @req.should have_been_made
    end

    it "should return the same access token" do
      token = @client.update_access_token(@token, {:att_n1 => 'att_v1'})
      token.attributes.should be_a Array
      token.attributes.first.name.should == 'att_n1'
    end
  end

  describe '.auth_codes' do
    before(:each) do
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/authorizationcodes").
         to_return(:status => 200, :body => fixture("auth_codes.json"), :headers => {})
    end

    it "should get the correct resource" do
      @client.auth_codes
      @req.should have_been_made
    end

    it "should return the same access token" do
      codes = @client.auth_codes
      codes.authorizationCode.should be_a Array
      codes.authorizationCode.first.code.should == 'm9PEEI6I'
    end
  end

  describe '.auth_code' do
    before(:each) do
      @code = 'm9PEEI6I'
      @req = stub_request(:get, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/authorizationcodes/#{@code}").
         to_return(:status => 200, :body => fixture("auth_code.json"), :headers => {})
    end

    it "should get the correct resource" do
      @client.auth_code(@code)
      @req.should have_been_made
    end

    it "should return the same access token" do
      code = @client.auth_code(@code)
      code.code.should == 'm9PEEI6I'
    end
  end

  describe '.delete_auth_code' do
    before(:each) do
      @code = 'm9PEEI6I'
      @req = stub_request(:delete, "https://sjobs:iphone@api.enterprise.apigee.com/v1/o/apple/oauth2/authorizationcodes/#{@code}").
         to_return(:status => 200, :body => fixture("auth_code.json"), :headers => {})
    end

    it "should get the correct resource" do
      @client.delete_auth_code(@code)
      @req.should have_been_made
    end

    it "should return the deleted code" do
      code = @client.delete_auth_code(@code)
      code.code.should == 'm9PEEI6I'
    end
  end

end