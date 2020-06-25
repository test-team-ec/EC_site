class ProductsController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @products = Product.where(genre_id: @genre.id)
      @index_title = @genre.name
    else
      @products = Product.all
      @index_title = "商品"
    end
  	@genres = Genre.where(is_active: "有効")
  end

  def show
  	@genres = Genre.where(is_active: "有効")
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  	@tax_price = (@product.price * 1.1).to_i
  end
end
