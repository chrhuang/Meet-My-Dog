# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Delete all Users ..."
puts "Create User ."
User.create!(email: "tom@email.com", password: "123456", nickname: "Thom")
puts "Create User .."
User.create!(email: "thomas@email.com", password: "123456", nickname: "Thomas")
puts "Create User ..."
User.create!(email: "christian@email.com", password: "123456", nickname: "Chris")
puts "Users Created !"