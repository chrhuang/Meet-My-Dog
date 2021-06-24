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
user = User.create!(email: "tom@email.com", password: "123456", nickname: "Tom", description: "Mon idée de site était meilleure bordel!")
user.photo.attach(io: file, filename: 'tom.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624437557/1_uphknu.jpg')
dog = Dog.create!(name: "Wouaf", user: user)
dog.photo.attach(io: file, filename: 'tomdog1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624437563/2_nala1q.jpg')
dog = Dog.create!(name: "Chocolat", user: user)
dog.photo.attach(io: file, filename: 'tomdog2.png', content_type: 'image/png')

puts "Create User .."
file = URI.open('https://avatars.githubusercontent.com/u/82810122?v=4')
user = User.create!(email: "thomas@email.com", password: "123456", nickname: "Thomas", description: "C'est là que le Blas blesse.")
user.photo.attach(io: file, filename: 'thomas.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624437567/5_mopkv2.jpg')
dog = Dog.create!(name: "Poki", user: user)
dog.photo.attach(io: file, filename: 'tomasdog1.png', content_type: 'image/png')

puts "Create User ..."
file = URI.open('https://avatars.githubusercontent.com/u/41517143?v=4')
user = User.create!(email: "christian@email.com", password: "123456", nickname: "Chris", description: "J'ai faim. On mange un tata cheese?")
user.photo.attach(io: file, filename: 'christian.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624524470/AdobeStock_190562703_hrzkio.jpg')
dog = Dog.create!(name: "Yugi", user: user)
dog.photo.attach(io: file, filename: 'christiandog.png', content_type: 'image/png')

puts "Users Created"

# ------------------------------------------------------------------------------------------------------------------------------------------------------------


puts "Delete all Sites ..."
Site.destroy_all

puts "Create Site ."
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624457118/7v2smpodpoa2r0uhyf88j2xfxvez.jpg')
site = Site.create!(name: "Parc Barbieux", description: "Le parc de Barbieux est situé dans la commune de Roubaix. C'est un parc remarquable par la présence de plus de 60 essences d'arbres. Il s’étend sur 1,5 kilomètre avec un joli plan d'eau.", long: 3.160818, lat: 50.675526)
site.photos.attach(io: file, filename: 'Barbieux.png', content_type: 'image/png')

puts "Create Site .."
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624441789/Citadelle_44j83b3.jpg')
site = Site.create!(name: "Citadelle de Lille", description: "Situé autour de la Citadelle, ce véritable poumon vert de 90 hectares, est le paradis des toutous, des familles et de tout ceux qui désirent profiter de la nature au sein d’une grande métropole.", long: 3.045384, lat: 50.64079)
site.photos.attach(io: file, filename: 'Citadelle.png', content_type: 'image/png')

puts "Create Site ..."
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624525689/Appartement-neuf-Villeneuve-dAscq-parc-Heron-Novacity-02_osepru.jpg')
site = Site.create!(name: "Parc du Héron", description: "Les quelques 110 hectares d'eau et de verdure constituant le Parc du Héron forment un remarquable terrain de jeu pour nos amis à 4 pattes. Ils pourront profiter d' une vaste zone de nature en métropole.", long: 3.1483957, lat: 50.6343157)
site.photos.attach(io: file, filename: 'ParcHeron.png', content_type: 'image/png')

puts "Create Site ...."
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624525689/Appartement-neuf-Villeneuve-dAscq-parc-Heron-Novacity-02_osepru.jpg')
site = Site.create!(name: "Prés du Hem", description: "Au coeur de 120 hectares de nature et autour d'un vaste lac, des dizaines d'activités ludiques, naturalistes et sportives attendent votre chien!.", long: 2.874436, lat: 50.698895)
site.photos.attach(io: file, filename: 'ParcHeron.png', content_type: 'image/png')

puts "Create Site ....."
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624526174/Parc-Jean-Baptiste-Lebas_news_image_top_zjy1uv.jpg')
site = Site.create!(name: "Parc Jean Baptiste Lebas", description: "Le parc Jean Baptiste Lebas est un jardin pour tous : jeux pour enfants, terrains de boules, placettes, grandes pelouses et parterres de fleurs. Votre compagnon adorera toute cette animation!", long: 3.069022, lat: 50.626658)
site.photos.attach(io: file, filename: 'ParcJBL.png', content_type: 'image/png')

puts "Create Site ......"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624527074/4QSp5dqK3zT9joFE_QFPvVkp14H-nKpPLRTi3mX977O00AhDUKOz4HzXDgAX1HOL25U1PFc4KerUl_btjkE3XTN-WxNQQ0MGLAW6IT1V3SL5u6eu3ClCIbbFAblReeTSQ-k_uvkuui.jpg')
site = Site.create!(name: "Forêt de Raismes-Saint-Amand-Wallers", description: "S’étendant sur 4 600 hectares, la forêt domaniale de Raismes-Saint-Amand-Wallers est parfaite pour les chiens qui ont besoin de se dépenser.", long: 3.496953, lat: 50.428708)
site.photos.attach(io: file, filename: 'ForetSA.png', content_type: 'image/png')

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
event = Event.create!(name: "Balade entre copains", walk: Walk.first, description: "Il fait beau, profitons-en: laissons nos toutous s'amuser dehors. N'oubliez pas les bières.", date: DateTime.strptime("23/06/2021 16:00", "%d/%m/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.first);
EventHasUser.create!(event: event, user: User.all[1]);

puts "Events Created"
