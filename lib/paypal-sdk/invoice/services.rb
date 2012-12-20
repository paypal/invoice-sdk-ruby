require 'paypal-sdk-core'

# AUTO GENERATED code for Invoice
module PayPal::SDK
  module Invoice

	  # Service Version
	  SERVICE_VERSION = "1.6.0"
	  # Service Name
	  SERVICE_NAME = "Invoice"

    module Services
      include DataTypes


      # Service Call: CreateInvoice
      # @param CreateInvoiceRequest
      # @return CreateInvoiceResponse
      def CreateInvoice(options = {} , http_header = {})
        request_object  = BuildCreateInvoice(options)
        request_hash    = request_object.to_hash
        response_hash   = request("CreateInvoice", request_hash, http_header)
        CreateInvoiceResponse.new(response_hash)
      end
      alias_method :create_invoice, :CreateInvoice

      def BuildCreateInvoice(options = {}, &block)
        klass     = CreateInvoiceRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_create_invoice, :BuildCreateInvoice

      # Service Call: SendInvoice
      # @param SendInvoiceRequest
      # @return SendInvoiceResponse
      def SendInvoice(options = {} , http_header = {})
        request_object  = BuildSendInvoice(options)
        request_hash    = request_object.to_hash
        response_hash   = request("SendInvoice", request_hash, http_header)
        SendInvoiceResponse.new(response_hash)
      end
      alias_method :send_invoice, :SendInvoice

      def BuildSendInvoice(options = {}, &block)
        klass     = SendInvoiceRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_send_invoice, :BuildSendInvoice

      # Service Call: CreateAndSendInvoice
      # @param CreateAndSendInvoiceRequest
      # @return CreateAndSendInvoiceResponse
      def CreateAndSendInvoice(options = {} , http_header = {})
        request_object  = BuildCreateAndSendInvoice(options)
        request_hash    = request_object.to_hash
        response_hash   = request("CreateAndSendInvoice", request_hash, http_header)
        CreateAndSendInvoiceResponse.new(response_hash)
      end
      alias_method :create_and_send_invoice, :CreateAndSendInvoice

      def BuildCreateAndSendInvoice(options = {}, &block)
        klass     = CreateAndSendInvoiceRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_create_and_send_invoice, :BuildCreateAndSendInvoice

      # Service Call: UpdateInvoice
      # @param UpdateInvoiceRequest
      # @return UpdateInvoiceResponse
      def UpdateInvoice(options = {} , http_header = {})
        request_object  = BuildUpdateInvoice(options)
        request_hash    = request_object.to_hash
        response_hash   = request("UpdateInvoice", request_hash, http_header)
        UpdateInvoiceResponse.new(response_hash)
      end
      alias_method :update_invoice, :UpdateInvoice

      def BuildUpdateInvoice(options = {}, &block)
        klass     = UpdateInvoiceRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_update_invoice, :BuildUpdateInvoice

      # Service Call: GetInvoiceDetails
      # @param GetInvoiceDetailsRequest
      # @return GetInvoiceDetailsResponse
      def GetInvoiceDetails(options = {} , http_header = {})
        request_object  = BuildGetInvoiceDetails(options)
        request_hash    = request_object.to_hash
        response_hash   = request("GetInvoiceDetails", request_hash, http_header)
        GetInvoiceDetailsResponse.new(response_hash)
      end
      alias_method :get_invoice_details, :GetInvoiceDetails

      def BuildGetInvoiceDetails(options = {}, &block)
        klass     = GetInvoiceDetailsRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_get_invoice_details, :BuildGetInvoiceDetails

      # Service Call: CancelInvoice
      # @param CancelInvoiceRequest
      # @return CancelInvoiceResponse
      def CancelInvoice(options = {} , http_header = {})
        request_object  = BuildCancelInvoice(options)
        request_hash    = request_object.to_hash
        response_hash   = request("CancelInvoice", request_hash, http_header)
        CancelInvoiceResponse.new(response_hash)
      end
      alias_method :cancel_invoice, :CancelInvoice

      def BuildCancelInvoice(options = {}, &block)
        klass     = CancelInvoiceRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_cancel_invoice, :BuildCancelInvoice

      # Service Call: SearchInvoices
      # @param SearchInvoicesRequest
      # @return SearchInvoicesResponse
      def SearchInvoices(options = {} , http_header = {})
        request_object  = BuildSearchInvoices(options)
        request_hash    = request_object.to_hash
        response_hash   = request("SearchInvoices", request_hash, http_header)
        SearchInvoicesResponse.new(response_hash)
      end
      alias_method :search_invoices, :SearchInvoices

      def BuildSearchInvoices(options = {}, &block)
        klass     = SearchInvoicesRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_search_invoices, :BuildSearchInvoices

      # Service Call: MarkInvoiceAsPaid
      # @param MarkInvoiceAsPaidRequest
      # @return MarkInvoiceAsPaidResponse
      def MarkInvoiceAsPaid(options = {} , http_header = {})
        request_object  = BuildMarkInvoiceAsPaid(options)
        request_hash    = request_object.to_hash
        response_hash   = request("MarkInvoiceAsPaid", request_hash, http_header)
        MarkInvoiceAsPaidResponse.new(response_hash)
      end
      alias_method :mark_invoice_as_paid, :MarkInvoiceAsPaid

      def BuildMarkInvoiceAsPaid(options = {}, &block)
        klass     = MarkInvoiceAsPaidRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_mark_invoice_as_paid, :BuildMarkInvoiceAsPaid

      # Service Call: MarkInvoiceAsUnpaid
      # @param MarkInvoiceAsUnpaidRequest
      # @return MarkInvoiceAsUnpaidResponse
      def MarkInvoiceAsUnpaid(options = {} , http_header = {})
        request_object  = BuildMarkInvoiceAsUnpaid(options)
        request_hash    = request_object.to_hash
        response_hash   = request("MarkInvoiceAsUnpaid", request_hash, http_header)
        MarkInvoiceAsUnpaidResponse.new(response_hash)
      end
      alias_method :mark_invoice_as_unpaid, :MarkInvoiceAsUnpaid

      def BuildMarkInvoiceAsUnpaid(options = {}, &block)
        klass     = MarkInvoiceAsUnpaidRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_mark_invoice_as_unpaid, :BuildMarkInvoiceAsUnpaid

      # Service Call: MarkInvoiceAsRefunded
      # @param MarkInvoiceAsRefundedRequest
      # @return MarkInvoiceAsRefundedResponse
      def MarkInvoiceAsRefunded(options = {} , http_header = {})
        request_object  = BuildMarkInvoiceAsRefunded(options)
        request_hash    = request_object.to_hash
        response_hash   = request("MarkInvoiceAsRefunded", request_hash, http_header)
        MarkInvoiceAsRefundedResponse.new(response_hash)
      end
      alias_method :mark_invoice_as_refunded, :MarkInvoiceAsRefunded

      def BuildMarkInvoiceAsRefunded(options = {}, &block)
        klass     = MarkInvoiceAsRefundedRequest
        object = options.is_a?(klass) ? options : klass.new(options || {})
        object.instance_eval(&block) if block
        object
      end
      alias_method :build_mark_invoice_as_refunded, :BuildMarkInvoiceAsRefunded


    end

  end
end
