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

# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end


#create the test-user
valid_user = User.create!(first_name: "first_name", last_name: "last_name", email: "mail@yopmail.com", password: "azeaze")


5.times do |f|
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
  Cart.create!(user: User.all[f])
end


####### this line /was for local test/use ########
13.times do |p|
  babar = "~/Documents/THP/Final_Project/pussy_corp/pussypics/picture#{p}.png"
  p = Product.create(
  title: "picture#{p}",
  description: "joli chaton ou un autre truc du style",
  price: rand(5..50).to_s,
  image_url: babar
  )
  
  p.save
 end
 ##########################################################  

 30.times do |i|
  CartProduct.create!(cart: Cart.all.sample, product: Product.all.sample)
end

user = User.first
@products = user.cart.products
@array = []

@products.each do |item|
  @array << [item.title, item.description, item.price]
end

order = Order.create!(order_command: "hie", product_list: @array , cart: Cart.all[0])