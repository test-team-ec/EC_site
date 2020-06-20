class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	@genres = Genre.all
  end

  def show
  	@genres = Genre.all
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  end

end
