class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items, source: :customer
  attachment :product_image
  
  def add_product(product_id)

    current_cart_item = cart_items.find_by_product_id(product_id)

    if current_item
      current_cart_item.count += 1
    else
      current_cart_item = cart_items.build(product_id: product_id)
    end
    current_cart_item
  end

  def total_price
    cart_items.to_a.sum { |product| product.total_price }
  end
end
