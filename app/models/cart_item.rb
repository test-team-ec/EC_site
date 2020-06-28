class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  def total_price
		@product.price * count
  end
end
