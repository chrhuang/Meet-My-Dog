require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongitudeside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# ------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "Delete all Users ..."
User.all.each { |user| user.photo.purge }
User.destroy_all

puts "Create User 1/3"
file = URI.open('https://avatars.githubusercontent.com/u/78411645?v=4')
user = User.create!(email: "tom@email.com", password: "123456", nickname: "Tom", description: "Mon idée de site était meilleure bordel!")
user.photo.attach(io: file, filename: 'tom.png', content_type: 'image/png')
file = URI.open('https://www.rd.com/wp-content/uploads/2021/01/GettyImages-588935825.jpg')
dog = Dog.create!(name: "Tyson", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'tomdog1.png', content_type: 'image/png')
file = URI.open('https://upload.chien.com/img_global/24-les-races-de-chiens/_light-17356-des-welsh-corgi-nagent-dans-la-piscine.jpg')
dog = Dog.create!(name: "Floyd", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'tomdog2.png', content_type: 'image/png')

puts "Create User 2/3"
file = URI.open('https://avatars.githubusercontent.com/u/82810122?v=4')
user = User.create!(email: "thomas@email.com", password: "123456", nickname: "Thomas", description: "C'est là que le Blas blesse.")
user.photo.attach(io: file, filename: 'thomas.png', content_type: 'image/png')
file = URI.open('https://media1.fdncms.com/orlando/imager/u/original/26765334/adobestock_107224974.jpeg')
dog = Dog.create!(name: "Poki", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'tomasdog1.png', content_type: 'image/png')

puts "Create User 3/3"
file = URI.open('https://avatars.githubusercontent.com/u/41517143?v=4')
user = User.create!(email: "christian@email.com", password: "123456", nickname: "Chris", description: "J'ai faim. On mange un tata cheese?")
user.photo.attach(io: file, filename: 'christian.png', content_type: 'image/png')
file = URI.open('https://race-shiba-inu.fr/wp-content/uploads/2019/09/Shiba_inu_taiki-869x1024.jpg')
dog = Dog.create!(name: "Yugi", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'christiandog.png', content_type: 'image/png')

puts "Users Created"

# ------------------------------------------------------------------------------------------------------------------------------------------------------------


puts "Delete all Sites ..."
Site.destroy_all

puts "Create Site 1/6"
file = URI.open('https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/visuels-annuaire/le-parc-de-la-citadelle/76380-1-fre-FR/Le-parc-de-la-Citadelle_news_image_top.jpg')
site = Site.create!(name: "Citadelle de Lille", description: "Situé autour de la Citadelle, ce véritable poumon vert de 90 hectares, est le paradis des toutous, des familles et de tout ceux qui désirent profiter de la nature au sein d’une grande métropole.", longitude: 3.045384, latitude: 50.64079, city: "Lille")
site.photos.attach(io: file, filename: 'Citadelle.png', content_type: 'image/png')

puts "Create Site 2/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624548583/kpnpwtirvm78k0jp8fedz6opt09p.jpg')
site = Site.create!(name: "Parc Barbieux", description: "Le parc de Barbieux est situé dans la commune de Roubaix. C'est un parc remarquable par la présence de plus de 60 essences d'arbres. Il s’étend sur 1,5 kilomètre avec un joli plan d'eau.", longitude: 3.160818, latitude: 50.675526, city: "Roubaix")
site.photos.attach(io: file, filename: 'Barbieux.png', content_type: 'image/png')

puts "Create Site 3/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624527074/4QSp5dqK3zT9joFE_QFPvVkp14H-nKpPLRTi3mX977O00AhDUKOz4HzXDgAX1HOL25U1PFc4KerUl_btjkE3XTN-WxNQQ0MGLAW6IT1V3SL5u6eu3ClCIbbFAblReeTSQ-k_uvkuui.jpg')
site = Site.create!(name: "Forêt de Raismes-Saint-Amand-Wallers", description: "S’étendant sur 4 600 hectares, la forêt domaniale de Raismes-Saint-Amand-Wallers est parfaite pour les chiens qui ont besoin de se dépenser.", longitude: 3.496953, latitude: 50.428708, city: "Raismes")
site.photos.attach(io: file, filename: 'ForetSA.png', content_type: 'image/png')


puts "Create Site 4/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624525689/Appartement-neuf-Villeneuve-dAscq-parc-Heron-Novacity-02_osepru.jpg')
site = Site.create!(name: "Prés du Hem", description: "Au coeur de 120 hectares de nature et autour d'un vaste lac, des dizaines d'activités ludiques, naturalistes et sportives attendent votre chien!.", longitude: 2.874436, latitude: 50.698895, city: "Armentières")
site.photos.attach(io: file, filename: 'ParcHeron.png', content_type: 'image/png')

puts "Create Site 5/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624526174/Parc-Jean-Baptiste-Lebas_news_image_top_zjy1uv.jpg')
site = Site.create!(name: "Parc Jean Baptiste Lebas", description: "Le parc Jean Baptiste Lebas est un jardin pour tous : jeux pour enfants, terrains de boules, placettes, grandes pelouses et parterres de fleurs. Votre compagnon adorera toute cette animation!", longitude: 3.069022, latitude: 50.626658, city: "Lille")
site.photos.attach(io: file, filename: 'ParcJBL.png', content_type: 'image/png')

puts "Create Site 6/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624525689/Appartement-neuf-Villeneuve-dAscq-parc-Heron-Novacity-02_osepru.jpg')
site = Site.create!(name: "Parc du Héron", description: "Les quelques 110 hectares d'eau et de verdure constituant le Parc du Héron forment un remarquable terrain de jeu pour nos amis à 4 pattes. Ils pourront profiter d' une vaste zone de nature en métropole.", longitude: 3.1483957, latitude: 50.6343157, city: "Villeneuve d'ascq")
site.photos.attach(io: file, filename: 'ParcHeron.png', content_type: 'image/png')


puts "Sites Created"


# ------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "Delete all Walks ..."
Walk.destroy_all

puts "Create Walk 1/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624539419/citadelle_juin_2020_01_dw1mwi.jpg')
walk = Walk.create!(name: "Tour à l'entrée de la citadelle", description: "balade au bord de l'eau, rapide et parfaite pour un petit chien.", length: 1, duration: 30,  site: Site.first)
walk.photo.attach(io: file, filename: 'citadelle01.png', content_type: 'image/png')

puts "Create Walk 2/6"
file = URI.open('https://parcdelacitadelle.lille.fr/sites/default/files/styles/full/public/thumbnails/image/p-01.premiere_enceintecphilippe_frutier.jpg?itok=SweekwvY')
walk = Walk.create!(name: "Visite intérieure de la citadelle", description: "balade à l'intérieur de l'enceinte de la citadelle.", length: 5, duration: 120,  site: Site.first)
walk.photo.attach(io: file, filename: 'citadelle02.png', content_type: 'image/png')

puts "Create Walk 3/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624539773/145151_88829_b1w2gu.jpg')
walk = Walk.create!(name: "longitudeue promenade autour de la citadelle", description: "Pour les toutous les plus sportifs, un tour complet de la citadelle.", length: 15, duration: 300,  site: Site.first)
walk.photo.attach(io: file, filename: 'citadelle03.png', content_type: 'image/png')

puts "Create Walk 4/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624540016/NBeTz3gLM77bt4O-gR0rvTgA30k_azsdef.jpg')
walk = Walk.create!(name: "Promenade au bord du lac", description: "Petite promenade sur la rive du lac, au calme pour se détendre les papattes.", length: 2.5, duration: 60,  site: Site.last)
walk.photo.attach(io: file, filename: 'heron01.png', content_type: 'image/png')

puts "Create Walk 5/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624540284/3942d8043f14e30dc57c3d3389c52d03_jzxzrz.jpg')
walk = Walk.create!(name: "Tour du petit lac", description: "Tour du petit lac pour dire bonjour aux chevaux de traits et aux oiseaux.", length: 7, duration: 240,  site: Site.last)
walk.photo.attach(io: file, filename: 'heron02.png', content_type: 'image/png')

puts "Create Walk 6/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624540506/drone1_oxzhom.jpg')
walk = Walk.create!(name: "Tour du complet du lac", description: "Tour complet du lac pour passer une journée à gambader dans la forest et peut-être apercevoir un héron au bord de l'eau.", length: 17, duration: 320,  site: Site.last)
walk.photo.attach(io: file, filename: 'heron03.png', content_type: 'image/png')

puts "Walks Created"


# ------------------------------------------------------------------------------------------------------------------------------------------------------------



puts "Delete all Events ..."
Event.destroy_all

puts "Create Event 1/6"
event = Event.create!(name: "Balade entre copains", walk: Walk.first, description: "Il fait beau, profitons-en: laissons nos toutous s'amuser dehors. N'oubliez pas les bières.", max_dog: 4, date: DateTime.strptime("08/21/2021 17:00", "%m/%d/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.first);
EventHasUser.create!(event: event, user: User.all[1]);
EventHasUser.create!(event: event, user: User.last);

puts "Create Event 2/6"
event = Event.create!(name: "Découverte de la citadelle", walk: Walk.all[1], description: "N'étant pas du Nord je viens découvrir ce lieu si prisé des lillois. Je viens ave 3 enfants.", max_dog: 2, date: DateTime.strptime("07/02/2021 16:00", "%m/%d/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.all[1]);

puts "Create Event 3/6"
event = Event.create!(name: "Footing avec sa boule de poils", walk: Walk.all[2], description: "N'étant pas du Nord je viens découvrir ce lieu si prisé des lillois. Je viens ave 3 enfants.", max_dog: 3, date: DateTime.strptime("07/23/2021 18:30", "%m/%d/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.all[2]);

puts "Create Event 4/6"
event = Event.create!(name: "Petite sortie matinale", walk: Walk.all[3], description: "Je sors mon chien rapidement avant le travail. Si quelqu'un veut venir prendre un café c'est avec plaisir.", max_dog: 2, date: DateTime.strptime("08/12/2021 7:30", "%m/%d/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.all[2]);

puts "Create Event 5/6"
event = Event.create!(name: "Balade habituelle du mercredi", walk: Walk.all[4], description: "J'emmène des balles et un frisbee pour faire courir nos molosses. Chiens joueurs bienvenus donc.", max_dog: 5, date: DateTime.strptime("07/14/2021 7:30", "%m/%d/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.all[1]);

puts "Create Event 6/6"
event = Event.create!(name: "Rando découverte du Lac", walk: Walk.all[5], description: "Nous venons faire une randonnée pour découvrir le lac dans ses moindres recoins. Le départ se fera de Forest sur marque.", max_dog: 3, date: DateTime.strptime("09/30/2021 12:30", "%m/%d/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.first);

puts "Events Created"

# ------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "Delete all POIS ..."
Poi.destroy_all

puts "Create POI 1/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624622208/water.png_u2ei4c.png')
poi = Poi.create!(name: "Point D'Eau")
poi.photo.attach(io: file, filename: 'water.png', content_type: 'image/png')

puts "Create POI 2/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624622208/poop.png_ubqssy.jpg')
poi = Poi.create!(name: "Sac à Crottes")
poi.photo.attach(io: file, filename: 'poop.png', content_type: 'image/png')

puts "Create POI 3/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624622208/toilets.png_l86bxi.png')
poi = Poi.create!(name: "Toilettes")
poi.photo.attach(io: file, filename: 'toilets.png', content_type: 'image/png')

puts "Create POI 4/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624622209/eat.png_orpml8.png')
poi = Poi.create!(name: "Restauration")
poi.photo.attach(io: file, filename: 'eat.png', content_type: 'image/png')

puts "Create POI 5/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624622210/play.png_lshsbo.jpg')
poi = Poi.create!(name: "Aire De Jeu")
poi.photo.attach(io: file, filename: 'play.png', content_type: 'image/png')

puts "Create POI 6/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624622208/rest.png_ouov6l.png')
poi = Poi.create!(name: "Aire De Repos")
poi.photo.attach(io: file, filename: 'rest.png', content_type: 'image/png')

puts "Create POI 7/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624622208/bin.png_shb66m.png')
poi = Poi.create!(name: "Poubelle")
poi.photo.attach(io: file, filename: 'bin.png', content_type: 'image/png')

puts "POIS Created"

# ------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "Delete all Temperaments ..."
Temperament.destroy_all

puts "Create Temperament 1/16"
temperament = Temperament.create!(name: "Bagarreur")

puts "Create Temperament 2/16"
temperament = Temperament.create!(name: "Craintif")

puts "Create Temperament 3/16"
temperament = Temperament.create!(name: "Joueur")

puts "Create Temperament 4/16"
temperament = Temperament.create!(name: "Affectueux")

puts "Create Temperament 5/16"
temperament = Temperament.create!(name: "OK Enfant")

puts "Create Temperament 6/16"
temperament = Temperament.create!(name: "Non OK Enfant")

puts "Create Temperament 7/16"
temperament = Temperament.create!(name: "Bavard")

puts "Create Temperament 8/16"
temperament = Temperament.create!(name: "Curieux")

puts "Create Temperament 9/16"
temperament = Temperament.create!(name: "Distant")

puts "Create Temperament 10/16"
temperament = Temperament.create!(name: "Aventureux")

puts "Create Temperament 11/16"
temperament = Temperament.create!(name: "Actif")

puts "Create Temperament 12/16"
temperament = Temperament.create!(name: "Futé")

puts "Create Temperament 13/16"
temperament = Temperament.create!(name: "Têtu")

puts "Create Temperament 14/16"
temperament = Temperament.create!(name: "Malicieux")

puts "Create Temperament 15/16"
temperament = Temperament.create!(name: "Nerveux")

puts "Create Temperament 16/16"
temperament = Temperament.create!(name: "Chasseur")

puts "Temperaments Created"

# ------------------------------------------------------------------------------------------------------------------------------------------------------------
