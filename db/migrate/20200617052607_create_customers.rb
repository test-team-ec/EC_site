class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :first_name
      t.string :last_name
      t.string :first_name_phonetic
      t.string :last_name_phonetic
      t.string :tel
      t.string :postcode
      t.string :address
      t.string :email
      t.string :password
      t.boolean :is_active

      t.timestamps
    end
  end
end
