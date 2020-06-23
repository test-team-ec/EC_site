class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items, source: :customer
  has_many :order_details, dependent: :destroy
  attachment :product_image

  belongs_to :genre
  def add_product(product_id)

    current_cart_item = cart_items.find_by_product_id(product_id)

    if current_item
      current_cart_item.count += 1
    else
      current_cart_item = cart_items.build(product_id: product_id)
    end
    current_cart_item
  end


	enum is_active: { 販売停止中: false, 販売中: true }
	#validates :is_active, inclusion: { in: [true, false] }

end
