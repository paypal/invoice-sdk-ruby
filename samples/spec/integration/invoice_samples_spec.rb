require 'spec_helper'

describe "InvoiceSamples" do
  def get_response_value(key)
    if find(:id, 'response').text =~ /#{key}: ([^\s]*)/
      $1.dup
    end
  end

  before :each do
    visit invoice_samples_path
  end

  describe "Invoice" do
    before :each do
      first(:link, "Create").click
      click_on "Submit"
      page.should have_content("ack: Success")
      @invoice_id = get_response_value("invoiceID")
    end

    it "Send" do
      first(:link, "Send").click
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Update" do
      click_link("Update")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Get Details" do
      click_link("Get Details")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")
    end

  end

  describe "Send Invoice" do
    before :each do
      click_link("Create & Send")
      click_on "Submit"
      page.should have_content("ack: Success")
      @invoice_id = get_response_value("invoiceID")
    end

    it "Cancel" do
      click_link("Cancel")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Mark as Paid" do
      click_link("Mark as Paid")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Mark as UnPaid" do
      click_link("Mark as Paid")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")

      click_link("Mark as UnPaid")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")
    end

    it "Mark as Refunded" do
      click_link("Mark as Paid")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")

      click_link("Mark as Refunded")
      fill_in "Invoice", :with => @invoice_id
      click_on "Submit"
      page.should have_content("ack: Success")
    end
  end

  it "Search" do
    click_link("Search")
    check("Draft")
    click_on "Submit"
    page.should have_content("ack: Success")
  end
end
