require_dependency "invoice_samples/application_controller"

module InvoiceSamples
  class InvoiceController < ApplicationController
    include PayPal::SDK::Invoice

    def index
      redirect_to :action => :create_invoice
    end

    def create_invoice
      @create_invoice = api.build_create_invoice(params[:CreateInvoiceRequest] || default_api_value)
      @create_invoice_response = api.create_invoice(@create_invoice) if request.post?
    end

    def send_invoice
      @send_invoice = api.build_send_invoice(params[:SendInvoiceRequest] || default_api_value)
      @send_invoice_response = api.send_invoice(@send_invoice) if request.post?
    end

    def create_and_send_invoice
      @create_and_send_invoice = api.build_create_and_send_invoice(params[:CreateAndSendInvoiceRequest] || default_api_value)
      @create_and_send_invoice_response = api.create_and_send_invoice(@create_and_send_invoice) if request.post?
    end

    def update_invoice
      @update_invoice = api.build_update_invoice(params[:UpdateInvoiceRequest] || default_api_value)
      @update_invoice_response = api.update_invoice(@update_invoice) if request.post?
    end

    def get_invoice_details
      @get_invoice_details = api.build_get_invoice_details(params[:GetInvoiceDetailsRequest] || default_api_value)
      @get_invoice_details_response = api.get_invoice_details(@get_invoice_details) if request.post?
    end

    def cancel_invoice
      @cancel_invoice = api.build_cancel_invoice(params[:CancelInvoiceRequest] || default_api_value)
      @cancel_invoice_response = api.cancel_invoice(@cancel_invoice) if request.post?
    end

    def search_invoices
      @search_invoices = api.build_search_invoices(params[:SearchInvoicesRequest] || default_api_value)
      @search_invoices_response = api.search_invoices(@search_invoices) if request.post?
    end

    def mark_invoice_as_paid
      @mark_invoice_as_paid = api.build_mark_invoice_as_paid(params[:MarkInvoiceAsPaidRequest] || default_api_value)
      @mark_invoice_as_paid_response = api.mark_invoice_as_paid(@mark_invoice_as_paid) if request.post?
    end

    def mark_invoice_as_unpaid
      @mark_invoice_as_unpaid = api.build_mark_invoice_as_unpaid(params[:MarkInvoiceAsUnpaidRequest] || default_api_value)
      @mark_invoice_as_unpaid_response = api.mark_invoice_as_unpaid(@mark_invoice_as_unpaid) if request.post?
    end

    def mark_invoice_as_refunded
      @mark_invoice_as_refunded = api.build_mark_invoice_as_refunded(params[:MarkInvoiceAsRefundedRequest] || default_api_value)
      @mark_invoice_as_refunded_response = api.mark_invoice_as_refunded(@mark_invoice_as_refunded) if request.post?
    end

    private

    def api
      @api ||= API.new
    end
  end
end

