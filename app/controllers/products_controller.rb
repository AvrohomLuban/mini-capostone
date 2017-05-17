class ProductsController < ApplicationController

  def index
    @all_products = Product.all.sort #added sort bec when edited moved to back
    render "index.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    flash[:info] = "You have succesfuly updated contact."
    redirect_to "/products/#{@product.id}"
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @product.save
    flash[:success] = "You have successfuly created new contact."
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "You have succesfuly deleted contact."
    redirect_to "/products"
  end

end
