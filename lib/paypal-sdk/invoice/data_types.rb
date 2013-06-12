# Stub objects for Invoice
# Auto generated code

require 'paypal-sdk-core'

module PayPal::SDK
  module Invoice
    module DataTypes

      class DataType < Core::API::DataTypes::Base
        def self.load_members
          add_attribute :xmlns
          add_attribute :type, :namespace => :xsi
        end
      end

      module ResponseStatus
        Status = { :success => ["Success", "SuccessWithWarning"],
                   :warning => ["Warning", "SuccessWithWarning", "FailureWithWarning"],
                   :failure => ["Failure", "FailureWithWarning"] }

        def response_status
          self.responseEnvelope && self.responseEnvelope.ack
        end

        Status.keys.each do |status|
          define_method("#{status}?") do
            Status[status].include?(self.response_status)
          end
        end
      end

      class EnumType < Core::API::DataTypes::Enum
      end

      class BaseAddress < DataType
        def self.load_members
          object_of :line1, String, :required => true
          object_of :line2, String
          object_of :city, String, :required => true
          object_of :state, String
          object_of :postalCode, String
          object_of :countryCode, String, :required => true
          object_of :type, String
        end
      end



      # This type contains the detailed error information resulting from the service operation. 
      class ErrorData < DataType
        def self.load_members
          object_of :errorId, Integer
          object_of :domain, String
          object_of :subdomain, String
          object_of :severity, ErrorSeverity
          object_of :category, ErrorCategory
          object_of :message, String
          object_of :exceptionId, String
          array_of :parameter, ErrorParameter
        end
      end



      class ErrorParameter < DataType
        def self.load_members
          add_attribute :name, :required => true
          object_of :value, String, :required => true
        end
      end



      # This specifies a fault, encapsulating error data, with specific error codes. 
      class FaultMessage < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end



      # This specifies the list of parameters with every request to the service. 
      class RequestEnvelope < DataType
        def self.load_members
          # This specifies the required detail level that is needed by a client application pertaining to a particular data component (e.g., Item, Transaction, etc.). The detail level is specified in the DetailLevelCodeType which has all the enumerated values of the detail level for each component. 
          object_of :detailLevel, DetailLevelCode
          # This should be the standard RFC 3066 language identification tag, e.g., en_US. 
          object_of :errorLanguage, String
        end
      end



      # This specifies a list of parameters with every response from a service. 
      class ResponseEnvelope < DataType
        def self.load_members
          object_of :timestamp, DateTime, :required => true
          # Application level acknowledgment code. 
          object_of :ack, AckCode, :required => true
          object_of :correlationId, String, :required => true
          object_of :build, String, :required => true
        end
      end



      #  AckCodeType This code identifies the acknowledgment code types that could be used to communicate the status of processing a (request) message to an application. This code would be used as part of a response message that contains an application level acknowledgment element. 
      class AckCode < EnumType
        self.options = { 'SUCCESS' => 'Success', 'FAILURE' => 'Failure', 'WARNING' => 'Warning', 'SUCCESSWITHWARNING' => 'SuccessWithWarning', 'FAILUREWITHWARNING' => 'FailureWithWarning' }
      end



      #  DetailLevelCodeType 
      class DetailLevelCode < EnumType
        self.options = { 'RETURNALL' => 'ReturnAll' }
      end



      class ErrorCategory < EnumType
        self.options = { 'SYSTEM' => 'System', 'APPLICATION' => 'Application', 'REQUEST' => 'Request' }
      end



      class ErrorSeverity < EnumType
        self.options = { 'ERROR' => 'Error', 'WARNING' => 'Warning' }
      end



      #  Specifies the payment terms for this invoice. 
      class PaymentTermsType < EnumType
        self.options = { 'DUEONRECEIPT' => 'DueOnReceipt', 'DUEONDATESPECIFIED' => 'DueOnDateSpecified', 'NET1' => 'Net10', 'NET2' => 'Net15', 'NET3' => 'Net30', 'NET4' => 'Net45' }
      end



      #  Specifies the payment methods that can be used to mark an invoice as paid. 
      class PaymentMethodsType < EnumType
        self.options = { 'BANKTRANSFER' => 'BankTransfer', 'CASH' => 'Cash', 'CHECK' => 'Check', 'CREDITCARD' => 'CreditCard', 'DEBITCARD' => 'DebitCard', 'OTHER' => 'Other', 'PAYPAL' => 'PayPal', 'WIRETRANSFER' => 'WireTransfer' }
      end



      #  Specifies the invoice status. 
      class StatusType < EnumType
        self.options = { 'DRAFT' => 'Draft', 'SENT' => 'Sent', 'PAID' => 'Paid', 'MARKEDASPAID' => 'MarkedAsPaid', 'CANCELED' => 'Canceled', 'REFUNDED' => 'Refunded', 'PARTIALLYREFUNDED' => 'PartiallyRefunded', 'MARKEDASREFUNDED' => 'MarkedAsRefunded' }
      end



      #  Specifies the merchant or payer. 
      class OriginType < EnumType
        self.options = { 'WEB' => 'Web', 'API' => 'API' }
      end



      #  Specifies the merchant or payer. 
      class ActorType < EnumType
        self.options = { 'MERCHANT' => 'Merchant', 'PAYER' => 'Payer' }
      end



      # Contact information for a company participating in the invoicing system. 
      class BusinessInfoType < DataType
        def self.load_members
          # First name of the company contact. 
          object_of :firstName, String
          # Last name of the company contact. 
          object_of :lastName, String
          # Business name of the company. 
          object_of :businessName, String
          # Phone number for contacting the company. 
          object_of :phone, String
          # Fax number used by the company. 
          object_of :fax, String
          # Website used by the company. 
          object_of :website, String
          # Tax ID of the merchant. 
          object_of :taxId, String
          # Custom value to be displayed in the contact information details. 
          object_of :customValue, String
          # Street address of the company. 
          object_of :address, BaseAddress
        end
      end



      # Item information about a service or product listed in the invoice. 
      class InvoiceItemType < DataType
        def self.load_members
          # SKU or item name. 
          object_of :name, String, :required => true
          # Description of the item. 
          object_of :description, String
          # Date on which the product or service was provided. 
          object_of :date, DateTime
          # Item count. 
          object_of :quantity, Float, :required => true
          # Price of the item, in the currency specified by the invoice. 
          object_of :unitPrice, Float, :required => true
          # Name of an applicable tax, if any. 
          object_of :taxName, String
          # Rate of an applicable tax, if any. 
          object_of :taxRate, Float
        end
      end



      # A list of invoice items. 
      class InvoiceItemListType < DataType
        def self.load_members
          array_of :item, InvoiceItemType, :required => true
        end
      end



      # Invoice details about the merchant, payer, totals and terms. 
      class InvoiceType < DataType
        def self.load_members
          # Merchant's email. 
          object_of :merchantEmail, String, :required => true
          # Email to which the invoice will be sent. 
          object_of :payerEmail, String, :required => true
          # Unique identifier for the invoice. 
          object_of :number, String
          # Company contact information of the merchant company sending the invoice. 
          object_of :merchantInfo, BusinessInfoType
          # List of items included in this invoice. 
          object_of :itemList, InvoiceItemListType, :required => true
          # If True, indicates tax calculated after discount. Default is False.
          object_of :taxCalculatedAfterDiscount, Boolean
          # Currency used for all invoice item amounts and totals. 
          object_of :currencyCode, String, :required => true
          # Date on which the invoice will be enabled. 
          object_of :invoiceDate, DateTime
          # Date on which the invoice payment is due. 
          object_of :dueDate, DateTime
          # Terms by which the invoice payment is due. 
          object_of :paymentTerms, PaymentTermsType, :required => true
          # A discount percent applied to the invoice, if any. 
          object_of :discountPercent, Float
          # A discount amount applied to the invoice, if any. If DiscountPercent is provided, DiscountAmount is ignored. 
          object_of :discountAmount, Float
          # If true, indicates tax included in item amount. If present, this setting will supersede the merchant’s default setting. 
          object_of :taxInclusive, Boolean
          # General terms for the invoice. 
          object_of :terms, String
          # Note to the payer company. 
          object_of :note, String
          # Memo for book keeping that is private to the Merchant. 
          object_of :merchantMemo, String
          # Details of the receipt. Applicable only when invoice is a receipt. 
          object_of :receiptDetails, String
          # Billing information for the payer. 
          object_of :billingInfo, BusinessInfoType
          # Shipping information for the payer. 
          object_of :shippingInfo, BusinessInfoType
          # Cost of shipping. 
          object_of :shippingAmount, Float
          # Name of the applicable tax on shipping cost, if any. 
          object_of :shippingTaxName, String
          # Rate of the applicable tax on shipping cost, if any. 
          object_of :shippingTaxRate, Float
          # The external image URL of the invoice's logo, if any 
          object_of :logoUrl, String
          # BN code for tracking transactions with a particular partner. 
          object_of :referrerCode, String
          # Label used to display custom amount value. If a value is entered for customAmountLabel, then customAmountValue cannot be empty. 
          object_of :customAmountLabel, String
          # Value of custom amount. If a value is entered for customAmountValue, then customAmountLabel cannot be empty. 
          object_of :customAmountValue, Float
        end
      end



      # Invoice details about the invoice status and state change dates. 
      class InvoiceDetailsType < DataType
        def self.load_members
          # Status of the invoice. 
          object_of :status, StatusType, :required => true
          # The total amount of the invoice (cost of items, shipping and tax, less any discount). This field is set by the invoicing system and will ignore any changes made by API callers. 
          object_of :totalAmount, Float
          # Whether the invoice was created via the website or via an API call. 
          object_of :origin, OriginType, :required => true
          # Date when the invoice was created. 
          object_of :createdDate, DateTime, :required => true
          # Account that created the invoice. 
          object_of :createdBy, String
          # If canceled, date when the invoice was canceled. 
          object_of :canceledDate, DateTime
          # Actor who canceled the invoice. 
          object_of :canceledByActor, ActorType
          # Account that canceled the invoice. 
          object_of :canceledBy, String
          # Date when the invoice was last edited. 
          object_of :lastUpdatedDate, DateTime
          # Account that last edited the invoice. 
          object_of :lastUpdatedBy, String
          # Date when the invoice was first sent. 
          object_of :firstSentDate, DateTime
          # Date when the invoice was last sent. 
          object_of :lastSentDate, DateTime
          # Account that last sent the invoice. 
          object_of :lastSentBy, String
          # If the invoice was paid, date when the invoice was paid. 
          object_of :paidDate, DateTime
        end
      end



      # Details of the refund made against this invoice. 
      class OtherPaymentRefundDetailsType < DataType
        def self.load_members
          # Optional note associated with the refund. 
          object_of :note, String
          # Date when the invoice was marked as refunded. If the date is not specified, the current date and time is used as a default. In addition, the date must be after the payment date of the invoice. 
          object_of :date, DateTime
        end
      end



      # Details of the paypal refund made against this invoice. 
      class PayPalPaymentRefundDetailsType < DataType
        def self.load_members
          # Date when the invoice was marked as refunded by PayPal. 
          object_of :date, DateTime
        end
      end



      # PayPal payment details about the invoice. 
      class PayPalPaymentDetailsType < DataType
        def self.load_members
          # Transaction ID of the PayPal payment. 
          object_of :transactionID, String, :required => true
          # Date when the invoice was paid. 
          object_of :date, DateTime
        end
      end



      # Offline payment details about the invoice. 
      class OtherPaymentDetailsType < DataType
        def self.load_members
          # Method used for the offline payment. 
          object_of :method, PaymentMethodsType
          # Optional note associated with the payment. 
          object_of :note, String
          # Date when the invoice was paid. 
          object_of :date, DateTime
        end
      end



      # Payment details about the invoice. 
      class PaymentDetailsType < DataType
        def self.load_members
          # True if the invoice was paid using PayPal. 
          object_of :viaPayPal, Boolean, :required => true
          # PayPal payment details. 
          object_of :paypalPayment, PayPalPaymentDetailsType
          # Other payment details. 
          object_of :otherPayment, OtherPaymentDetailsType
        end
      end



      # Determines an inclusive date range. 
      class DateRangeType < DataType
        def self.load_members
          # Start of the date range. 
          object_of :startDate, DateTime
          # End of the date range. 
          object_of :endDate, DateTime
        end
      end



      # Search parameters criteria. 
      class SearchParametersType < DataType
        def self.load_members
          # Email search string. 
          object_of :email, String
          # Recipient search string. 
          object_of :recipientName, String
          # Company search string. 
          object_of :businessName, String
          # Invoice number search string. 
          object_of :invoiceNumber, String
          # Invoice status search. 
          array_of :status, StatusType
          # Invoice amount search. Specifies the smallest amount to be returned. 
          object_of :lowerAmount, Float
          # Invoice amount search. Specifies the largest amount to be returned. 
          object_of :upperAmount, Float
          # Currency used for lower and upper amounts. Required when lowerAmount or upperAmount is specified. 
          object_of :currencyCode, String
          # Invoice memo search string. 
          object_of :memo, String
          # Whether the invoice was created via the website or via an API call. 
          object_of :origin, OriginType
          # Invoice date range filter. 
          object_of :invoiceDate, DateRangeType
          # Invoice due date range filter. 
          object_of :dueDate, DateRangeType
          # Invoice payment date range filter. 
          object_of :paymentDate, DateRangeType
          # Invoice creation date range filter. 
          object_of :creationDate, DateRangeType
        end
      end



      # Summary of invoice information. 
      class InvoiceSummaryType < DataType
        def self.load_members
          # The created invoice's ID. 
          object_of :invoiceID, String, :required => true
          # Invoice creator's email. 
          object_of :merchantEmail, String, :required => true
          # Email to which the invoice will be sent. 
          object_of :payerEmail, String, :required => true
          # Unique identifier for the invoice. 
          object_of :number, String, :required => true
          # Business name of the billing info. 
          object_of :billingBusinessName, String
          # First name of the billing info. 
          object_of :billingFirstName, String
          # Last name of the billing info. 
          object_of :billingLastName, String
          # Business name of the shipping info. 
          object_of :shippingBusinessName, String
          # First name of the shipping info. 
          object_of :shippingFirstName, String
          # Last name of the shipping info. 
          object_of :shippingLastName, String
          # Total amount of the invoice. 
          object_of :totalAmount, Float, :required => true
          # Currency used for all invoice item amounts and totals. 
          object_of :currencyCode, String, :required => true
          # Date on which the invoice will be enabled. 
          object_of :invoiceDate, DateTime, :required => true
          # Date on which the invoice payment is due. 
          object_of :dueDate, DateTime, :required => true
          # Status of the invoice. 
          object_of :status, StatusType, :required => true
          # Whether the invoice was created via the website or via an API call. 
          object_of :origin, OriginType, :required => true
          # BN code for tracking transactions with a particular partner. 
          object_of :referrerCode, String
        end
      end



      # A list of invoice summaries. 
      class InvoiceSummaryListType < DataType
        def self.load_members
          array_of :invoice, InvoiceSummaryType
        end
      end



      # The request object for CreateInvoice. 
      class CreateInvoiceRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Data to populate the newly created invoice. 
          object_of :invoice, InvoiceType, :required => true
        end
      end



      # The response object for CreateInvoice. 
      class CreateInvoiceResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The created invoice's ID. 
          object_of :invoiceID, String, :required => true
          # The created invoice's number. 
          object_of :invoiceNumber, String, :required => true
          # The URL which lead merchant to view the invoice details on web. 
          object_of :invoiceURL, String, :required => true
          # The total amount of the invoice (cost of items, shipping and tax, less any discount). 
          object_of :totalAmount, Integer, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for SendInvoice. 
      class SendInvoiceRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # ID of the invoice to send. 
          object_of :invoiceID, String, :required => true
        end
      end



      # The response object for SendInvoice. 
      class SendInvoiceResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The sent invoice's ID. 
          object_of :invoiceID, String, :required => true
          # The URL which lead merchant to view the invoice details on web. 
          object_of :invoiceURL, String, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for CreateAndSendInvoice. 
      class CreateAndSendInvoiceRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Data to populate the newly created invoice. 
          object_of :invoice, InvoiceType, :required => true
        end
      end



      # The response object for CreateAndSendInvoice. 
      class CreateAndSendInvoiceResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The created invoice's ID. 
          object_of :invoiceID, String, :required => true
          # The created invoice's number. 
          object_of :invoiceNumber, String, :required => true
          # The URL which lead merchant to view the invoice details on web. 
          object_of :invoiceURL, String, :required => true
          # The total amount of the invoice (cost of items, shipping and tax, less any discount). 
          object_of :totalAmount, Integer, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for UpdateInvoice. 
      class UpdateInvoiceRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # invoice's ID 
          object_of :invoiceID, String, :required => true
          # Data to populate the newly created invoice. 
          object_of :invoice, InvoiceType, :required => true
        end
      end



      # The response object for UpdateInvoice. 
      class UpdateInvoiceResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The invoice's ID. 
          object_of :invoiceID, String, :required => true
          # The updated invoice's number. 
          object_of :invoiceNumber, String, :required => true
          # The URL which lead merchant to view the invoice details on web. 
          object_of :invoiceURL, String, :required => true
          # The total amount of the invoice (cost of items, shipping and tax, less any discount). 
          object_of :totalAmount, Integer, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for GetInvoiceDetails. 
      class GetInvoiceDetailsRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # ID of the invoice to retrieve. 
          object_of :invoiceID, String, :required => true
        end
      end



      # The response object for CreateInvoice. 
      class GetInvoiceDetailsResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The requested invoice. 
          object_of :invoice, InvoiceType, :required => true
          # The requested invoice details. 
          object_of :invoiceDetails, InvoiceDetailsType, :required => true
          # The requested invoice payment details. 
          object_of :paymentDetails, PaymentDetailsType
          # The requested invoice refund details. 
          object_of :refundDetails, PaymentRefundDetailsType
          # The URL which lead merchant to view the invoice details on web. 
          object_of :invoiceURL, String, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for CancelInvoice. 
      class CancelInvoiceRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # invoice's ID 
          object_of :invoiceID, String
          # Subject of the cancellation notification 
          object_of :subject, String
          # Note to send payer within the cancellation notification 
          object_of :noteForPayer, String
          # send a copy of cancellation notification to merchant 
          object_of :sendCopyToMerchant, Boolean
        end
      end



      # The response object for CancelInvoice. 
      class CancelInvoiceResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The canceled invoice's ID. 
          object_of :invoiceID, String, :required => true
          # The canceled invoice's number. 
          object_of :invoiceNumber, String, :required => true
          # The URL which lead merchant to view the invoice details on web. 
          object_of :invoiceURL, String, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for SearchInvoices. 
      class SearchInvoicesRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # Invoice creator's email. 
          object_of :merchantEmail, String, :required => true
          # Parameters constraining the search. 
          object_of :parameters, SearchParametersType, :required => true
          # Page number of result set, starting with 1. 
          object_of :page, Integer, :required => true
          # Number of results per page, between 1 and 100. 
          object_of :pageSize, Integer, :required => true
        end
      end



      # The response object for SearchInvoices. 
      class SearchInvoicesResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # Number of invoices that matched the search. 
          object_of :count, Integer, :required => true
          # Page of invoice summaries that matched the search. 
          object_of :invoiceList, InvoiceSummaryListType
          # Page number of result set. 
          object_of :page, Integer, :required => true
          # True if another page of invoice summary results exists. 
          object_of :hasNextPage, Boolean, :required => true
          # True if a previous page of invoice summary results exists. 
          object_of :hasPreviousPage, Boolean, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for MarkInvoiceAsPaid. 
      class MarkInvoiceAsPaidRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # ID of the invoice to mark as paid. 
          object_of :invoiceID, String, :required => true
          # Details of the payment made against this invoice. 
          object_of :payment, OtherPaymentDetailsType, :required => true
        end
      end



      # The response object for MarkInvoiceAsPaid. 
      class MarkInvoiceAsPaidResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The paid invoice ID. 
          object_of :invoiceID, String, :required => true
          # The paid invoice number. 
          object_of :invoiceNumber, String, :required => true
          # The URL which lead merchant to view the invoice details on web. 
          object_of :invoiceURL, String, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for MarkInvoiceAsRefunded. 
      class MarkInvoiceAsRefundedRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # ID of the invoice to mark as refunded. 
          object_of :invoiceID, String, :required => true
          # Details of the refund made against this invoice. 
          object_of :refundDetail, OtherPaymentRefundDetailsType, :required => true
        end
      end



      # The response object for MarkInvoiceAsRefunded. 
      class MarkInvoiceAsRefundedResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The invoice ID of the invoice that was marked as refunded. 
          object_of :invoiceID, String, :required => true
          # The invoice number of the invoice that was marked as refunded. 
          object_of :invoiceNumber, String, :required => true
          # The URL of the details page of the invoice that was marked as refunded. 
          object_of :invoiceURL, String, :required => true
          array_of :error, ErrorData
        end
      end



      # The request object for MarkInvoiceAsUnpaid. 
      class MarkInvoiceAsUnpaidRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # ID of the invoice to mark as unpaid. 
          object_of :invoiceID, String, :required => true
        end
      end



      # The response object for MarkInvoiceAsUnpaid. 
      class MarkInvoiceAsUnpaidResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          # The invoice ID of the invoice that was marked as unpaid. 
          object_of :invoiceID, String, :required => true
          # The invoice number of the invoice that was marked as unpaid. 
          object_of :invoiceNumber, String, :required => true
          # The URL of the details page of the invoice that was marked as unpaid. 
          object_of :invoiceURL, String, :required => true
          array_of :error, ErrorData
        end
      end



      # Payment refund details about the invoice.  
      class PaymentRefundDetailsType < DataType
        def self.load_members
          # True if the invoice was refunded using PayPal.  
          object_of :viaPayPal, Boolean, :required => true
          # Other payment refund details.  
          object_of :paypalPayment, PayPalPaymentRefundDetailsType
          # details.  
          object_of :otherPayment, OtherPaymentRefundDetailsType
        end
      end



      # The request object for DeleteInvoice. 
      class DeleteInvoiceRequest < DataType
        def self.load_members
          object_of :requestEnvelope, RequestEnvelope, :required => true
          # ID of the invoice to be deleted. 
          object_of :invoiceID, String, :required => true
        end
      end



      # The response object for DeleteInvoice. 
      class DeleteInvoiceResponse < DataType
        def self.load_members
          include ResponseStatus
          object_of :responseEnvelope, ResponseEnvelope, :required => true
          array_of :error, ErrorData
        end
      end





      constants.each do |data_type_klass|
        data_type_klass = const_get(data_type_klass)
        data_type_klass.load_members if defined? data_type_klass.load_members
      end

    end
  end
end
