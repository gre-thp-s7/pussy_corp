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
Product.destroy_all

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


20.times do |p|
  p = Product.create!(
  name: Faker::Name.name,
  description: Faker::Quote.most_interesting_man_in_the_world,
  price: rand(5..50),
  image_url: Faker::Address.full_address
  )
  puts "La photo de #{p.name} a été crée"
end

10.times do |o|
  o = Order.create!(
    order_number: 10
  )
end
puts "commande 10 créée"

10.times do |o|
  o = Order.create!(
    order_number: 20
  )
end
puts "commande 20 créée"
