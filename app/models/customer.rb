class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items ,source: :product
  has_many :orders, dependent: :destroy
  has_many :shippings, dependent: :destroy

  enum is_active: { 退会済: false, 有効: true }
  acts_as_paranoid
end
