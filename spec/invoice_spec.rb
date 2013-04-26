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

end
