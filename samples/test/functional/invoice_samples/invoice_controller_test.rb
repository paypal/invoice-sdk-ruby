require 'test_helper'

module InvoiceSamples
  class InvoiceControllerTest < ActionController::TestCase
    test "should get pay" do
      get :pay
      assert_response :success
    end
  
  end
end
