require 'spec_helper'

describe "Invoice" do

  before :all do
    @client = PayPal::SDK::Invoice::API.new
  end

  describe "Services" do
    PayPal::SDK::Invoice::Services.instance_methods.select{|s| s =~ /^[A-Z]/ and s !~ /^Build/ }.each do |service_method|
      it "make empty request to #{service_method}" do
        response = @client.send(service_method, {})
        response.response_envelope.ack.should_not be_nil
      end
    end
  end

  describe "DataTypes" do
    PayPal::SDK::Invoice::DataTypes.constants.each do |const_name|
      it "create object for #{const_name}" do
        klass = PayPal::SDK::Invoice::DataTypes.const_get(const_name)
        klass.new.should be_a klass
      end
    end
  end

end
