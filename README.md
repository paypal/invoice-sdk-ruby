# Invoice SDK

The PayPal Invoice SDK provides Ruby APIs to create and manage Invoices using the PayPal's Invoicing Service API.

## Installation

Add this line to your application's Gemfile:

    gem 'paypal-sdk-invoice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paypal-sdk-invoice

## Configuration

For Rails application:

    rails g paypal:sdk:install

For other ruby application, create a configuration file(`config/paypal.yml`):

    development: &default
      username: jb-us-seller_api1.paypal.com
      password: WX4WTU3S8MY44S7F
      signature: AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy
      app_id: APP-80W284485P519543T
      http_timeout: 30
      mode: sandbox
      # # with certificate
      # cert_path: "config/cert_key.pem"
      # # with token authentication
      # token: ESTy2hio5WJQo1iixkH29I53RJxaS0Gvno1A6.YQXZgktxbY4I2Tdg
      # token_secret: ZKPhUYuwJwYsfWdzorozWO2U9pI
      # # with Proxy
      # http_proxy: http://proxy-ipaddress:3129/
      # # with device ip address
      # device_ipaddress: "127.0.0.1"
    test:
      <<: *default
    production:
      <<: *default
      mode: live

Load Configurations from specified file:

    PayPal::SDK::Core::Config.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')

## Create API object

Create API object:

    api = PayPal::SDK::Invoice::API.new

Override configuration while creating a object:

    api = PayPal::SDK::Invoice::API.new(:development)
    api = PayPal::SDK::Invoice::API.new(:development, :app_id => "XYZ")
    api = PayPal::SDK::Invoice::API.new(:app_id => "XYZ")    # Take default environment.

Change configuration:

    api.set_config :testing
    api.set_config :testing, app_id => "XYZ"


## Build Request Object

To make api request, we need to build a request object.

    # To build a empty request object
    create_invoice_request = api.build_create_invoice()

    # To build a request object with default data
    create_invoice_request = api.build_create_invoice( :invoice => { :merchantEmail => "jb-us-seller@paypal.com" })

The Build method can be access with camelcase or underscore:

    api = api.build_create_invoice()
    # (or)
    api = api.BuildCreateInvoice()

## Assign value to members

Members can be access with camelcase or underscore format.

    create_invoice_request.invoice.itemList.item[0].name = "item1"
    # With underscore
    create_invoice_request.invoice.item_list.item[0].name = "item1"

To Assign multiple values:

    create_invoice_request.invoice.itemList.item[0] = { :name => "item1", :quantity => 2.0, :unitPrice => 5.0 }

To Get members list for the given object( For Reference ):

    create_invoice_request.members
    create_invoice_request.baseAmountList.members

## Make API Request

Make api call with request object:

    create_invoice_response = api.create_invoice(create_invoice_request)

Make api call with hash:

    create_invoice_response = api.create_invoice( :invoice => { :merchantEmail => "jb-us-seller@paypal.com", :payerEmail => "sender@yahoo.com" } )

## Access values from response object

To get response status:

    create_invoice_response.responseEnvelope.ack


## Example

```ruby
require 'paypal-sdk-invoice'
@api = PayPal::SDK::Invoice::API.new

# Build request object
@create_invoice_request = @api.build_create_invoice()
@create_invoice_request.invoice.merchantEmail = "jb-us-seller@paypal.com"
@create_invoice_request.invoice.payerEmail    = "sender@yahoo.com"
@create_invoice_request.invoice.itemList.item[0].name      = "item1"
@create_invoice_request.invoice.itemList.item[0].quantity  = 2.0
@create_invoice_request.invoice.itemList.item[0].unitPrice = 5.0
@create_invoice_request.invoice.currencyCode  = "USD"
@create_invoice_request.invoice.paymentTerms  = "DueOnReceipt"

# Make API call & get response
@create_invoice_response = @api.create_invoice(@create_invoice_request)

# Access Response
@create_invoice_response.responseEnvelope
@create_invoice_response.invoiceID
@create_invoice_response.invoiceNumber
@create_invoice_response.invoiceURL
@create_invoice_response.totalAmount
```

## Samples

Add following line in rails `Gemfile`:

    gem 'paypal-sdk-invoice'
    gem 'invoice_samples', :git => "https://github.com/paypal/invoice-sdk-ruby.git", :group => :development

Configure routes(`config/routes.rb`):

    mount InvoiceSamples::Engine => "/samples" if Rails.env.development?

To get default paypal configuration execute:

    rails g paypal:sdk:install

Run `rails server` and check the samples.
