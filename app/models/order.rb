class Order < ApplicationRecord
  belongs_to :customer
  enum address_option: { customer.adress: 0, current_customer.shipping.address: 1, order_address.new: 2 }
end
