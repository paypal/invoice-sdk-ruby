$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "invoice_samples/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "invoice_samples"
  s.version     = InvoiceSamples::VERSION
  s.authors     = ["siddick"]
  s.email       = ["mebramsha@paypal.com"]
  s.homepage    = "https://www.x.com/"
  s.summary     = "Samples for Invoice."
  s.description = "Samples for Invoice."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "paypal-sdk-invoice"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "therubyracer"
  s.add_dependency "less-rails"
  s.add_dependency "simple_form"
  s.add_dependency "haml"
  s.add_dependency "coderay"
  s.add_dependency "jquery-rails"
end
