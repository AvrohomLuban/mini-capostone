Rails.application.routes.draw do
  get "/allproducts", to: 'products#all_products_method'
  get "/add_a_product", to: 'products#add_a_product_method'
  post "/you_added", to: 'products#you_added_method'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
