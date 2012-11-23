require 'paypal-sdk-core'

module PayPal
  module SDK
    module Invoice
      class API < Core::API::Platform
        include Services

        def initialize(environment = nil, options = {})
          super(SERVICE_NAME, environment, options)
        end

        INVOICE_HTTP_HEADER = { "X-PAYPAL-REQUEST-SOURCE" => "invoice-ruby-sdk-#{VERSION}" }
        def default_http_header
          super.merge(INVOICE_HTTP_HEADER)
        end
      end
    end
  end
end

