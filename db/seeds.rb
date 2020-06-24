# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(genre_id: 1, name:"チョコケーキ", price: 200, introduction:"チョコケーキです",
	product_image_id: "", is_active: "販売中")
Product.create(genre_id: 1, name:"チーズケーキ", price: 200, introduction:"チーズケーキです",
	product_image_id: "", is_active: "販売中")
Product.create(genre_id: 2, name:"チョコクッキー", price: 100, introduction:"チョコクッキーです",
	product_image_id: "", is_active: "販売中")
