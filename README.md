# Invoice SDK

The PayPal Invoice SDK provides Ruby APIs to create and manage Invoices using the PayPal's Invoicing Service API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paypal-sdk-invoice'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install paypal-sdk-invoice
```

## Configuration

For Rails application:

```bash
$ rails g paypal:sdk:install
```

For other ruby application, create a configuration file(`config/paypal.yml`):

```yaml
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
```
  
Load Configurations from specified file:

```ruby
PayPal::SDK::Core::Config.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')
```

## Example

```ruby
require 'paypal-sdk-invoice'
@api = PayPal::SDK::Invoice::API.new(
  :mode      => "sandbox",  # Set "live" for production
  :app_id    => "APP-80W284485P519543T",
  :username  => "jb-us-seller_api1.paypal.com",
  :password  => "WX4WTU3S8MY44S7F",
  :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy" )

# Build request object
@create_invoice = @api.build_create_invoice({
  :invoice => {
    :merchantEmail => "jb-us-seller@paypal.com",
    :payerEmail => "sender@yahoo.com",
    :itemList => {
      :item => [{
        :name => "item1",
        :quantity => 2.0,
        :unitPrice => 5.0 }] },
    :currencyCode => "USD",
    :paymentTerms => "DueOnReceipt" } })

# Make API call & get response
@create_invoice_response = @api.create_invoice(@create_invoice)

# Access Response
if @create_invoice_response.success?
  @create_invoice_response.invoiceID
  @create_invoice_response.invoiceNumber
  @create_invoice_response.invoiceURL
else
  print @create_invoice_response.error[0].message
end
```

For more samples [paypal-sdk-samples.herokuapp.com/invoice/](https://paypal-sdk-samples.herokuapp.com/invoice/)

## Samples App

Add following line in rails `Gemfile`:

```ruby
gem 'paypal-sdk-invoice'
gem 'invoice_samples', :git => "https://github.com/paypal/invoice-sdk-ruby.git", :group => :development
```

Configure routes(`config/routes.rb`):

```ruby
mount InvoiceSamples::Engine => "/samples" if Rails.env.development?
```

To get default paypal configuration execute:

```bash
$ rails g paypal:sdk:install
```

Run `rails server` and check the samples.
