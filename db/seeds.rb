require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# ------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "Delete all Users ..."
User.all.each { |user| user.photo.purge }
User.destroy_all

puts "Create User ."
file = URI.open('https://avatars.githubusercontent.com/u/78411645?v=4')
user = User.create!(email: "tom@email.com", password: "123456", nickname: "Thom", description: "Blablablablabla ceci est une description")
user.photo.attach(io: file, filename: 'tom.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624437557/1_uphknu.jpg')
dog = Dog.create!(name: "Wouaf", user: user)
dog.photo.attach(io: file, filename: 'tomdog1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624437563/2_nala1q.jpg')
dog = Dog.create!(name: "Chocolat", user: user)
dog.photo.attach(io: file, filename: 'tomdog2.png', content_type: 'image/png')

puts "Create User .."
file = URI.open('https://avatars.githubusercontent.com/u/82810122?v=4')
user = User.create!(email: "thomas@email.com", password: "123456", nickname: "Thomas", description: "Blablablablabla ceci est une description")
user.photo.attach(io: file, filename: 'thomas.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624437567/5_mopkv2.jpg')
dog = Dog.create!(name: "Poki", user: user)
dog.photo.attach(io: file, filename: 'tomasdog1.png', content_type: 'image/png')

puts "Create User ..."
file = URI.open('https://avatars.githubusercontent.com/u/41517143?v=4')
user = User.create!(email: "christian@email.com", password: "123456", nickname: "Chris", description: "Blablablablabla ceci est une description")
user.photo.attach(io: file, filename: 'christian.png', content_type: 'image/png')

puts "Users Created"

# ------------------------------------------------------------------------------------------------------------------------------------------------------------


puts "Delete all Sites ..."
Site.destroy_all

puts "Create Site ."
file = URI.open('https://cdn.shortpixel.ai/client/q_glossy,ret_img/https://www.roubaixtourisme.com/wp-content/uploads/2018/09/lac.jpg')
site = Site.create!(name: "Parc Barbieux")
site.photo.attach(io: file, filename: 'Barbieux.png', content_type: 'image/png')

puts "Sites Created"


# ------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "Delete all Walks ..."
Walk.destroy_all

puts "Create Walk ."
Walk.create!(name: "Petit trajet", site: Site.first)

puts "Walks Created"


# ------------------------------------------------------------------------------------------------------------------------------------------------------------



puts "Delete all Events ..."
Event.destroy_all

puts "Create Event ."
event = Event.create!(name: "Balade entre copain", walk: Walk.first, description: "Blablabla ceci est une description pour un event", date: DateTime.strptime("23/06/2021 16:00", "%d/%m/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.first);
EventHasUser.create!(event: event, user: User.all[1]);

puts "Events Created"