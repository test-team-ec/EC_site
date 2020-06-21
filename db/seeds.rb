# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(genre_id: 1, name:"ショートケーキ", price: 200, introduction:"ショートケーキです",
	product_image_id: "", is_active: true)
Product.create(genre_id: 2, name:"クッキー", price: 100, introduction:"クッキーです",
	product_image_id: "", is_active: true)

Genre.create(name: "ケーキ", is_active:"true")
Genre.create(name: "焼き菓子", is_active:"true")

Customer.create(first_name: "test", last_name: "test", first_name_phonetic: "test",
	last_name_phonetic: "test", tel:"1234567890", postcode: "1234567", address:"東京都",
	email:"test@test", password:"testtest", is_active:"true" )

Shipping.create(customer_id: 1, name:"test", postcode:"1234567", address:"大阪府")

Admin.create(email: "admin@admin", password: "adminadmin")
