# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# petit clean de db
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('products')
Order.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('orders')
Cart.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('carts')
CartProduct.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cart_products')

# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end


#create the test-user/admin
User.create!(first_name: "first_name", last_name: "last_name", email: "mail@yopmail.com", password: "azeaze", is_admin: true)
  puts "###############################################"
  puts "L\'admin(user) de test a été crée"
  puts "###############################################"


3.times do |f|
  f = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
  puts f
  puts f.id
  c = Cart.create!(user_id: f.id)
  puts c
  puts c.user_id
end


####### this line /was for local test/use ########
13.times do |p|
  babar = "~/Documents/THP/Final_Project/pussy_corp/pussypics/picture#{p}.png"
  p = Product.create(
  name: "picture#{p}",
  description: "joli chaton ou un autre truc du style",
  price: rand(5..50).to_s,
  image_url: babar
  )

 end
 ##########################################################

 10.times do |i|
  c = CartProduct.create!(cart_id: Cart.all.sample.id, product_id: Product.all.sample.id)
  puts c.cart_id
  puts c.product_id
end

user = User.last
puts user
puts user.cart.id
@products_bought = user.cart.cart_products
@array = []

@products_bought.each do |item|
  @array << item.product_id
end

order = Order.create!(order_command: "hie", product_list: @array , cart: Cart.all[0])
puts order
