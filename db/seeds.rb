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
user = User.create!(email: "tom@email.com", password: "123456", nickname: "Tom", description: "Arrivé sur Lille depuis peu avec mes 2 chiens, j'ai hâte de découvrir des lieux sympas pour les balader.")
user.photo.attach(io: file, filename: 'tom.png', content_type: 'image/png')
file = URI.open('https://www.rd.com/wp-content/uploads/2021/01/GettyImages-588935825.jpg')
dog = Dog.create!(name: "Tyson", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'tomdog1.png', content_type: 'image/png')
file = URI.open('https://upload.chien.com/img_global/24-les-races-de-chiens/_light-17356-des-welsh-corgi-nagent-dans-la-piscine.jpg')
dog = Dog.create!(name: "Floyd", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'tomdog2.png', content_type: 'image/png')

puts "Create User 2/3"
file = URI.open('https://avatars.githubusercontent.com/u/82810122?v=4')
user = User.create!(email: "thomas@email.com", password: "123456", nickname: "Thomas", description: "Une sortie à plusieurs c'est toujours plus sympa alors me voilà sur MeetMyDog. Au plaisir de partager une balade!")
user.photo.attach(io: file, filename: 'thomas.png', content_type: 'image/png')
file = URI.open('https://media1.fdncms.com/orlando/imager/u/original/26765334/adobestock_107224974.jpeg')
dog = Dog.create!(name: "Poki", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'tomasdog1.png', content_type: 'image/png')

puts "Create User 3/3"
file = URI.open('https://avatars.githubusercontent.com/u/41517143?v=4')
user = User.create!(email: "christian@email.com", password: "123456", nickname: "Chris", description: "Mon chien Yugi adore jouer avec d'autres chiens donc n'hésitez pas à rejoindre mes balades, j'en poste régulièrement.")
user.photo.attach(io: file, filename: 'christian.png', content_type: 'image/png')
file = URI.open('https://race-shiba-inu.fr/wp-content/uploads/2019/09/Shiba_inu_taiki-869x1024.jpg')
dog = Dog.create!(name: "Yugi", user: user, size: "Grand", gender: "male", age: 2)
dog.photo.attach(io: file, filename: 'christiandog.png', content_type: 'image/png')

puts "Users Created"

# ------------------------------------------------------------------------------------------------------------------------------------------------------------


puts "Delete all Sites ..."
Site.destroy_all

puts "Create Site 1/7"
file = URI.open('https://www.lille.fr/var/www/storage/images/mediatheque/mairie-de-lille/visuels-annuaire/le-parc-de-la-citadelle/76380-1-fre-FR/Le-parc-de-la-Citadelle_news_image_top.jpg')
site = Site.create!(name: "Citadelle de Lille", description: "Situé autour de la Citadelle, ce véritable poumon vert de 90 hectares, est le paradis des toutous, des familles et de tout ceux qui désirent profiter de la nature au sein d’une grande métropole.", longitude: 3.045384, latitude: 50.64079, city: "Lille")
site.photos.attach(io: file, filename: 'Citadelle.png', content_type: 'image/png')

puts "Create Site 2/7"
file = URI.open('https://static.actu.fr/uploads/2020/05/parc-barbieux-roubaix-exhibition-sexuelle-adolescents.jpg')
site = Site.create!(name: "Parc Barbieux", description: "Le parc de Barbieux est situé dans la commune de Roubaix. C'est un parc remarquable par la présence de plus de 60 essences d'arbres. Il s’étend sur 1,5 kilomètre avec un joli plan d'eau.", longitude: 3.160818, latitude: 50.675526, city: "Roubaix")
site.photos.attach(io: file, filename: 'Barbieux.png', content_type: 'image/png')

puts "Create Site 3/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624527074/4QSp5dqK3zT9joFE_QFPvVkp14H-nKpPLRTi3mX977O00AhDUKOz4HzXDgAX1HOL25U1PFc4KerUl_btjkE3XTN-WxNQQ0MGLAW6IT1V3SL5u6eu3ClCIbbFAblReeTSQ-k_uvkuui.jpg')
site = Site.create!(name: "Forêt de Raismes-Saint-Amand-Wallers", description: "S’étendant sur 4 600 hectares, la forêt domaniale de Raismes-Saint-Amand-Wallers est parfaite pour les chiens qui ont besoin de se dépenser.", longitude: 3.496953, latitude: 50.428708, city: "Raismes")
site.photos.attach(io: file, filename: 'ForetSA.png', content_type: 'image/png')


puts "Create Site 4/7"
file = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/05/b5/a9/21/les-pres-du-hem.jpg')
site = Site.create!(name: "Prés du Hem", description: "Au coeur de 120 hectares de nature et autour d'un vaste lac, des dizaines d'activités ludiques, naturalistes et sportives attendent votre chien!.", longitude: 2.874436, latitude: 50.698895, city: "Armentières")
site.photos.attach(io: file, filename: 'ParcHeron.png', content_type: 'image/png')

puts "Create Site 5/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624526174/Parc-Jean-Baptiste-Lebas_news_image_top_zjy1uv.jpg')
site = Site.create!(name: "Parc Jean Baptiste Lebas", description: "Le parc Jean Baptiste Lebas est un jardin pour tous : jeux pour enfants, terrains de boules, placettes, grandes pelouses et parterres de fleurs. Votre compagnon adorera toute cette animation!", longitude: 3.069022, latitude: 50.626658, city: "Lille")
site.photos.attach(io: file, filename: 'ParcJBL.png', content_type: 'image/png')

puts "Create Site 6/7"
file = URI.open('https://i.pinimg.com/originals/6d/28/f6/6d28f63fdaacb906c15bca9c150c6025.jpg')
site = Site.create!(name: "Promenade Des Anglais", description: "La promenade des Anglais est une avenue longeant le bord de mer face à la baie des Anges, à Nice. Son histoire, liée aux débuts du tourisme international, et sa situation exceptionnelle, en bord de mer, longée par des hôtels prestigieux, en font l'une des plus célèbres avenues du monde.", longitude: 7.23752931889528, latitude: 43.686018, city: "Nice")
site.photos.attach(io: file, filename: 'Promenade des anglais.png', content_type: 'image/png')

puts "Create Site 7/7"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624525689/Appartement-neuf-Villeneuve-dAscq-parc-Heron-Novacity-02_osepru.jpg')
site = Site.create!(name: "Parc du Héron", description: "Les quelques 110 hectares d'eau et de verdure constituant le Parc du Héron forment un remarquable terrain de jeu pour nos amis à 4 pattes. Ils pourront profiter d' une vaste zone de nature en métropole.", longitude: 3.1483957, latitude: 50.6343157, city: "Villeneuve d'ascq")
site.photos.attach(io: file, filename: 'ParcHeron.png', content_type: 'image/png')


puts "Sites Created"


# ------------------------------------------------------------------------------------------------------------------------------------------------------------

puts "Delete all Walks ..."
Walk.destroy_all

puts "Create Walk 1/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624539419/citadelle_juin_2020_01_dw1mwi.jpg')
walk = Walk.create!(name: "Tour à l'entrée de la citadelle", description: "balade au bord de l'eau, rapide et parfaite pour un petit chien.", length: 6.33962, duration: 7,  site: Site.first, coords: "3.0510403488002567,50.63785293163426;3.0507831279417417,50.63825596827243;3.052447498199257,50.6397817185246;3.053476381630361,50.63981050578934;3.0510403488002567,50.63784333548142")
walk.photo.attach(io: file, filename: 'citadelle01.png', content_type: 'image/png')

puts "Create Walk 2/6"
file = URI.open('https://parcdelacitadelle.lille.fr/sites/default/files/styles/full/public/thumbnails/image/p-01.premiere_enceintecphilippe_frutier.jpg?itok=SweekwvY')
walk = Walk.create!(name: "Visite intérieure de la citadelle", description: "balade à l'intérieur de l'enceinte de la citadelle.", length: 24.929989999999997, duration: 29,  site: Site.first, coords:"3.0507872034807235,50.63826373560909;3.047367846482615,50.640412456853824;3.048518507615313,50.6418581736562;3.0443805269024153,50.64361676861617;3.0403613378798013,50.64166008337483;3.042069639471862,50.63873723847533;3.0472171427305454,50.63883498804961;3.0473114099764587,50.63967055032734;3.0507770795808824,50.6382693208364")
walk.photo.attach(io: file, filename: 'citadelle02.png', content_type: 'image/png')

puts "Create Walk 3/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624539773/145151_88829_b1w2gu.jpg')
walk = Walk.create!(name: "Longue promenade autour de la citadelle", description: "Pour les toutous les plus sportifs, un tour complet de la citadelle.", length: 41.031459999999996, duration: 48,  site: Site.first, coords:"3.05157266288316,50.63741358159632;3.0508455335009614,50.638284774640255;3.0524357220453453,50.64092110422277;3.0521418067155537,50.64277546074564;3.0499896894020253,50.64466250952697;3.0473779003244204,50.64690614557625;3.047814369673034,50.648811198624344;3.0468249227432125,50.647999979727246;3.0442238666771573,50.646807517565605;3.0404401997552952,50.645016718162424;3.0390133007229565,50.644290815907766;3.0373714177396494,50.642170834070214;3.0371166465809836,50.64104666100411;3.0370820355314834,50.63982259479471;3.037726954135593,50.63949138176565;3.038746210959772,50.63898144643804;3.040558014279924,50.63778958265914;3.0420249583457633,50.63716673754951;3.043809866823352,50.63685652251618;3.0449648829877844,50.63696545333383;3.048193059747973,50.637569521619895;3.0506973439291585,50.63825223753619;3.0516014935886915,50.637411449900526")
walk.photo.attach(io: file, filename: 'citadelle03.png', content_type: 'image/png')

puts "Create Walk 4/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624540016/NBeTz3gLM77bt4O-gR0rvTgA30k_azsdef.jpg')
walk = Walk.create!(name: "Promenade au bord du lac", description: "Petite promenade sur la rive du lac, au calme pour se détendre les papattes.", length: 9.49, duration: 11,  site: Site.last, coords:"3.1553353960466097,50.634908708650045;3.1588574261108135,50.635904982111754;3.1604727751127655,50.63669535867868;3.160071736422964,50.636946853073454;3.1575617880321545,50.63610034803048;3.1562194649370667,50.63525807694788;3.155618516685365,50.63530889750163;3.1554090661267367,50.63528675876941;3.1553389226206434,50.63491283922957")
walk.photo.attach(io: file, filename: 'heron01.png', content_type: 'image/png')

puts "Create Walk 5/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624540284/3942d8043f14e30dc57c3d3389c52d03_jzxzrz.jpg')
walk = Walk.create!(name: "Tour du petit lac", description: "Tour du petit lac pour dire bonjour aux chevaux de traits et aux oiseaux.", length: 28.78999, duration: 33,  site: Site.last, coords:"3.1551589248744563,50.634045745638105;3.1522814927969307,50.63432831846117;3.1522005755421105,50.63582649564185;3.148969453557868,50.635951116901225;3.1491295559148114,50.63538339719727;3.147773494694519,50.6354725227242;3.14853412553839,50.63407416309704;3.144711663999516,50.63522830925663;3.1437493307813043,50.63416451835374;3.1445100322775374,50.6336703996372;3.148898651030862,50.633690773884524;3.152766240948239,50.632995248251405;3.15487044695638,50.63278846837585;3.1551519956474863,50.6340291339848")
walk.photo.attach(io: file, filename: 'heron02.png', content_type: 'image/png')

puts "Create Walk 6/6"
file = URI.open('https://res.cloudinary.com/dtn8c7o7m/image/upload/v1624540506/drone1_oxzhom.jpg')
walk = Walk.create!(name: "Tour du complet du lac", description: "Tour complet du lac pour passer une journée à gambader dans la forest et peut-être apercevoir un héron au bord de l'eau.", length: 41.57966999999999, duration: 52,  site: Site.last, coords:"3.155419751676874,50.635292683622936;3.157350775844634,50.63593253159863;3.1600114005842386,50.63696126423088;3.1603810348600234,50.636612424455535;3.1580829420387317,50.63533017723191;3.155545503598887,50.63490096880932;3.1550694656692713,50.63476985979989;3.154627174138909,50.63248384341517;3.1431814587337783,50.63292476753381;3.1430359246992623,50.63456795027747;3.1422335360711884,50.6356873305441;3.1443637245232594,50.63692547827148;3.146123246652195,50.63628933089174;3.1484777762645137,50.63646184628644;3.151367819172293,50.63648340967245;3.1533823445082874,50.63596047067381;3.1537797752018832,50.63499622656096;3.1551117759649685,50.634912164420285;3.1554166134573904,50.635290448723595")
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
event = Event.create!(name: "Découverte de la citadelle", walk: Walk.all[1], description: "N'étant pas du Nord je viens découvrir ce lieu si prisé des lillois. Je viens avec 3 enfants.", max_dog: 2, date: DateTime.strptime("07/02/2021 16:00", "%m/%d/%Y %H:%M"))
EventHasUser.create!(event: event, user: User.all[1]);

puts "Create Event 3/6"
event = Event.create!(name: "Footing avec sa boule de poils", walk: Walk.all[2], description: "N'étant pas du Nord je viens découvrir ce lieu si prisé des lillois. Je viens avec 3 enfants.", max_dog: 3, date: DateTime.strptime("07/23/2021 18:30", "%m/%d/%Y %H:%M"))
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
