class StoreController < ApplicationController
  before_filter :initialize_cart
  def index
    @products = Product.order('price DESC').page(params[:page])
    @categories = Category.all 
  end

  def search_results
    #Here we will be using the Product model to acutally search
    @search_results = Product.where("name LIKE ?", "%#{params['search']}%")

    @search_results = Category.where("name LIKE ?", "%#{params['search']}%").first if @search_results.empty?
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_product
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id) 
    redirect_to :root
  end

  def remove_product
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to :root
  end

  def forget_me_bro
    session[:cart] = nil
    redirect_to :root
  end

  def checkout
    @customer       = Customer.new
    @provinces      = Province.order(:name)

  end
protected

  def initialize_cart
    session[:cart] ||= []
    @cart_items = []
    session[:cart].each {|id| @cart_items << Product.find(id)}
  end

end
