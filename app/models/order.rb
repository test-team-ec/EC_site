class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum address_option: { customer.adress: 0, current_customer.shipping.address: 1, order_adress.new: 2 }
end
