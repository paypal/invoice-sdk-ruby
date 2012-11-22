InvoiceSamples::Engine.routes.draw do
  match "invoice(/:action)",  :controller => "invoice", :as => :invoice
  root :to => "invoice#index"
end
