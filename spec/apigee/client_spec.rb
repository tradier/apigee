require 'spec_helper'

describe Apigee::Client do

  before do
    @options = { :adapter => :em_synchrony, :user_agent => 'Apigee::Client spec' }
    @keys = Apigee::Configuration::VALID_OPTIONS_KEYS
  end

  describe '.new' do
    before(:each) do
      @keys.each do |key|
        Apigee.send("#{key}=", key)
      end
    end

    after do
      Apigee.reset
    end

    context 'with module configuration' do
      it "should inherit module configuration" do
        api = Apigee::Client.new
        @keys.each do |key|
          api.send(key).should eq(key)
        end
      end
    end

    context 'with class configuration' do
      context "during initialization" do
        it "should override module configuration" do
          api = Apigee::Client.new(@options)
          @keys.each do |key|
            h = @options.has_key?(key) ? @options : Apigee.options
            api.send(key).should eq(h[key])
          end
        end
      end

      context "after initialization" do
        it "should override module configuration after initialization" do
          api = Apigee::Client.new
          @options.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            h = @options.has_key?(key) ? @options : Apigee.options
            api.send(key).should eq(h[key])
          end
        end
      end
    end
  end
end