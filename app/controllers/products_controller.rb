class ProductsController < ApplicationController

  def all_products_method
    @all_products = Product.all
    @first_product = Product.first
    render "all_products.html.erb"
  end

end
