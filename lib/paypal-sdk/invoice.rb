require 'paypal-sdk-core'

module PayPal
  module SDK
    module Invoice
      autoload :VERSION,   "paypal-sdk/invoice/version"
      autoload :Services,  "paypal-sdk/invoice/services"
      autoload :DataTypes, "paypal-sdk/invoice/data_types"
      autoload :API,       "paypal-sdk/invoice/api"

      def self.new(*args)
        API.new(*args)
      end
    end
  end
end
