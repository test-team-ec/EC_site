class CartItem < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :products, dependent: :destroy
end
