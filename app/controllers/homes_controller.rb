class HomesController < ApplicationController
  def top
  	@genres = Genre.where(is_active: "有効")
  	@products = Product.all
  end

  def about
  end
end
