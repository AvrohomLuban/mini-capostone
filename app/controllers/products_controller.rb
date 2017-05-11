class ProductsController < ApplicationController

  def all_products_method
    @all_products = Product.all
    @first_product = Product.first
    render "all_products.html.erb"
  end

  def add_a_product_method
    render "add_a_product_page.html.erb"
  end

  def you_added_method
    @product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @product.save
    render "you_added_page.html.erb"
  end

end
