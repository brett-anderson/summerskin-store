class StoreController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  def search
    # No code required here
  end #Automagically loads app/views/store/search.html.erb
  def search_results
    #Here we will be using the Product model to acutally search
    @products = Product.where("name LIKE ?", "%#{params['keywords']}%")
  end
end
