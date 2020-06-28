class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items, source: :customer
  has_many :order_details, dependent: :destroy
  attachment :product_image

  belongs_to :genre

	enum is_active: { 販売停止中: false, 販売中: true }

end
