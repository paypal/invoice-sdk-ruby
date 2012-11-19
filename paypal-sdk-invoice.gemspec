# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal-sdk/invoice/version'

Gem::Specification.new do |gem|
  gem.name          = "paypal-sdk-invoice"
  gem.version       = PayPal::SDK::Invoice::VERSION
  gem.authors       = ["siddick"]
  gem.email         = ["mebramsha@paypal.com"]
  gem.description   = %q{Invoice SDK}
  gem.summary       = %q{Invoice SDK}
  gem.homepage      = "https://www.x.com/"

  gem.files         = Dir["**/*"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('paypal-sdk-core')
end
