require 'spec_helper'

describe "InvoiceSamples" do
  before :each do
    visit invoice_samples_path
  end

  describe "Invoice" do
    before :each do
      check_sample("Create")
      @invoice_id = get_response_value("invoiceID")
    end

    it_check_sample "Send" do
      fill_in "Invoice", :with => @invoice_id
    end

    it_check_sample "Update" do
      fill_in "Invoice", :with => @invoice_id
    end

    it_check_sample "Get Details" do
      fill_in "Invoice", :with => @invoice_id
    end
  end

  describe "Send Invoice" do
    before :each do
      check_sample("Create & Send")
      @invoice_id = get_response_value("invoiceID")
    end

    it_check_sample "Cancel" do
      fill_in "Invoice", :with => @invoice_id
    end

    it_check_sample "Mark as Paid" do
      fill_in "Invoice", :with => @invoice_id
    end

    it "Mark as UnPaid" do
      check_sample("Mark as Paid") do
        fill_in "Invoice", :with => @invoice_id
      end

      check_sample("Mark as UnPaid") do
        fill_in "Invoice", :with => @invoice_id
      end
    end

    it "Mark as Refunded" do
      check_sample("Mark as Paid") do
        fill_in "Invoice", :with => @invoice_id
      end

      check_sample("Mark as Refunded") do
        fill_in "Invoice", :with => @invoice_id
      end
    end
  end

  it_check_sample "Search" do
    check("Draft")
  end
end
