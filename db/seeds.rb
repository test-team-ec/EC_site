# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(genre_id: 1, name:"ショートケーキ", price: 200, introduction:"ショートケーキです",
	product_image_id: "", is_active: "販売中")
Product.create(genre_id: 2, name:"クッキー", price: 100, introduction:"クッキーです",
	product_image_id: "", is_active: "販売中")
Product.create(genre_id: 3, name:"プリン", price: 100, introduction:"プリンです",
	product_image_id: "", is_active: "販売中")

Genre.create(name: "ケーキ", is_active:"有効")
Genre.create(name: "焼き菓子", is_active:"有効")
Genre.create(name: "プリン", is_active:"無効")

Customer.create(first_name: "test", last_name: "test", first_name_phonetic: "test",
	last_name_phonetic: "test", tel:"1234567890", postcode: "1234567", address:"東京都",
	email:"test@test", password:"testtest", is_active:"有効" )

Shipping.create(customer_id: 1, name:"test", postcode:"1234567", address:"大阪府")

Order.create(customer_id: 1, name:"test", postcode: "1234567", address:"東京都",
	postage: 800, total_products_cost: 330, payment_method:"　クレジットカード", order_status: "入金待ち")

OrderDetail.create(product_id: 1, order_id: 1, count: 1, price: 220, work_status: "着手不可" )
OrderDetail.create(product_id: 2, order_id: 1, count: 1, price: 110, work_status: "着手不可" )

Administer.create(email: "admin@admin",password: "adminadmin")