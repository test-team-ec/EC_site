class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	@genres = Genre.all
  end

  def show
  	@genres = Genre.all
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  	@tax_price = (@product.price * 1.08).to_i
  end

end
