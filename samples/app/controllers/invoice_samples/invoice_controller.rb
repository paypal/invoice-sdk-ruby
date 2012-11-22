require_dependency "invoice_samples/application_controller"

module InvoiceSamples
  class InvoiceController < ApplicationController
    include PayPal::SDK::Invoice

    SERVICE_ACTIONS = Services.instance_methods.select{|s| s =~ /^[A-Z]/ and s !~ /^Build/ }
    build_services(SERVICE_ACTIONS, "", "_response", "Request")

    def index
      redirect_to :action => :create_invoice
    end

    private

    def api
      @api ||= API.new
    end
  end
end
