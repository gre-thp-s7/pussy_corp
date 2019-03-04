# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Products.destroy_all

# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end

5.times do |u|
  u = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  encrypted_password: Faker::Internet.password
  )
  puts "L\'utilisateur #{u.first_name} a été crée"
end


5.times do |p|
  p = Product.create!(
  name: Faker::Name.first_name,
  description: Faker::Quote.most_interesting_man_in_the_world,
  price: rand(5..50),
  image_url: Faker::LoremPixel.image('50x60', false, 'cat')
  )
  puts "La photo de #{p.name} a été crée"
end