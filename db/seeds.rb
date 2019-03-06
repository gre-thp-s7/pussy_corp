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


5.times do |u|
  u = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
  puts "L\'utilisateur #{u.first_name} a été crée"
end


####### this line /was for local test/use ########
13.times do |p|
  babar = "~/Documents/THP/Final_Project/pussy_corp/pussypics/picture#{p}.png"
  name = "picture#{p}"
  p = Product.create(
  name: name,
  description: "joli chaton ou un autre truc du style",
  price: rand(5..50),
  image_url: babar
  )
  puts "La photo de #{p.name} a été crée"
  p.save
 end
 ##########################################################  

10.times do |o|
  o = Order.create!(
    order_number: 10,
    user_id: User.all.sample.id
  )
end
puts "commande 10 créée"

10.times do |o|
  o = Order.create!(
    order_number: 20,
    user_id: User.all.sample.id
  )
end
puts "commande 20 créée"