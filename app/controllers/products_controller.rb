class ProductsController < ApplicationController

  def index
    if params[:sort] && params[:order]
      @all_products = Product.all.order(params[:sort] => params[:order])
    elsif params[:sort]
      @all_products = Product.all.order(params[:sort])
    elsif params[:lessthen]
      @all_products = Product.where("price<=?",params[:lessthen])
    else
       @all_products = Product.all.order(:name)
    end
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

  def search
    @all_products = Product.where(name: params[:searchbox])
    @all_products += Product.where(price: params[:searchbox])
    @all_products += Product.where(description: params[:searchbox])
    redirect_to "/products"
  end


end
