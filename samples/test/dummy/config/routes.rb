Dummy::Application.routes.draw do

  mount InvoiceSamples::Engine => "/samples", :as => :invoice_samples

end
