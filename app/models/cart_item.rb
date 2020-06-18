class CartItem < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :product, dependent: :destroy
end
