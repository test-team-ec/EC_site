class HomesController < ApplicationController
  def top
  	# サイドバーのジャンル検索に、有効なもののみ表示
  	@genres = Genre.where(is_active: "有効")
  	@products = Product.all
  end

  def about
  end
end
