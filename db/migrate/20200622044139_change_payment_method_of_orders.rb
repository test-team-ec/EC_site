class ChangePaymentMethodOfOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :payment_method, :boolean, default: true
  end

  def down
    change_column :orders, :payment_method, :boolean
  end
end
