class StoreController < ApplicationController
  before_filter :initialize_cart


  def index
    today = Time.now
    @products = Product.order('price DESC').page(params[:page]).per(8)
    @categories = Category.all 
    # @q = Product.search(params[:q])
    # @product = @q.result(distinct: true)
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
    @provinces = Province.all
    
    if params[:customer]
      customer       = Customer.new(params[:customer])
      customer.save

      @provinces      = Province.order(:name)
      @order          = customer.orders.build
      @order.status   = "new"
      @order.pst_rate = @order.customer.province.pst
      @order.gst_rate = @order.customer.province.gst
      @order.hst_rate = @order.customer.province.hst
      session[:cart].each do |product|
        line_item          = @order.lineitems.build
        line_item.product  = Product.find(product)
        line_item.quantity = 1
        line_item.price    = line_item.product.price
        line_item.save
      end
      @order.save
      redirect_to :root
      flash[:message] = 'Thank you! Your order has been placed!'
    end




    # One new customer
    # one new order
    # one new line item per cart item
    # clear cart
    # success message
  end

  def filter_new
    today = Time.now
    @products = Product.where("created_at <= '#{today}'").page(params[:page]).per(8)
    @categories = Category.all 
    render action: :index

  end
  def filter_sale
    @products = Product.where(sale: true).page(params[:page]).per(8)
    @categories = Category.all 
    render action: :index
  end

protected
  def initialize_cart
    session[:cart] ||= []
    @cart_items = []
    session[:cart].each {|id| @cart_items << Product.find(id)}
  end

end
