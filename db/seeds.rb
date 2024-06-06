# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Property.destroy_all
User.destroy_all

puts "Creating users..."

users = [
  { first_name: "Tsuyoshi", last_name: "Domoto", email: "tdomoto88@gmail.com", password: "123456", is_owner: true },
  { first_name: "Lance", last_name: "Masina", email: "lance@lancemasina.com", password: "123456", is_owner: true },
  { first_name: "Xavier", last_name: "Ropero", email: "xavier.ropero@gmail.com", password: "123456", is_owner: true },
  { first_name: "Hugh", last_name: "Clayton", email: "hughgrassbyclayton@hotmail.com", password: "123456", is_owner: true },
  { first_name: "John", last_name: "Doe", email: "john@gmail.com", password: "123456", is_owner: false },
  { first_name: "Jane", last_name: "Doe", email: "jane@gmail.com", password: "123456", is_owner: false }
]

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end

puts "Creating properties..."

properties = [
  {
    price: 19111, age: 1983, city: "Nagano", prefecture: "Kyoto",
    address: "Nantan, Kyoto 601-0773, Japan", bedrooms: 5,
    bathrooms: 2,
    description: "This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.",
    user: User.first,
    photo_url: 'https://miro.medium.com/v2/resize:fit:1100/format:webp/1*MiIHXrnOPuwXCwL3yE3iUA.png',
    photo_filename: "akiya.png",
    size_building: 100,
    size_land: 200,
    views: 100
  },
  {
    price: 11466, age: 1926, city: "Kyoto", prefecture: "Kyoto",
    address: "Fukuchiyama, Kyoto 620-0211, Japan", bedrooms: 3, bathrooms: 1,
    description: "This 130-year-old house is nestled in a tranquil residential neighborhood and boasts a detached building and a warehouse. The detached building spans 1,257 square feet, and the property offers ample parking for five kei cars.",
    user: User.last,
    photo_url: 'https://tokyoportfolio.com/wp-content/uploads/2023/10/akiyas-in-Japan.jpg',
    photo_filename: "akiya2.png",
    size_land: 200,
    size_building: 120,
    views: 100
  },
  {
    price: 22296, age: 1965, city: "Kyoto", prefecture: "Kyoto",
    address: "Kyotango, Kyoto 629-3101, Japan", bedrooms: 8, bathrooms: 3,
    description: "This 8-bedroom, 1-kitchen house is located in a quiet area near the sea. The wooden, 2-story building is 58 years old and is a short 20-minute walk from Amino Station on the Amino-cho Line.",
    user: User.first,
    photo_url: 'https://i0.wp.com/zenbird.media/wp-content/uploads/2021/05/akiya_top.jpg?w=1000&ssl=1',
    photo_filename: "akiya3.png",
    size_land: 200,
    size_building: 100,
    views: 100
  },
  {
    price: 15858, age: 1971, city: "Kyoto", prefecture: "Kyoto",
    address: "Tanaka Asukaicho, Kyoto, 606-8304 Japan", bedrooms: 1, bathrooms: 1,
    description: "This 1-bedroom condo is located in Tanaka Asukaimachi, Sakyo Ward, Kyoto City, Kyoto Prefecture. The 51-year-old steel-frame building features 1 bedroom, 1 dining room, and 1 kitchen. It is a 6-minute walk from Tanaka Station on the Eizan Electric Railway Eizan Main Line.",
    user: User.last,
    photo_url: 'https://img4.athome.jp/image_files/path/_EUvG6gTHD3SpEkJQtucfQ==.jpeg',
    photo_filename: "akiya4.png",
    size_land: 200,
    size_building: 80,
    views: 100
  },
  {
    price: 10783, age: 1933, city: "Osaka", prefecture: "Osaka",
    address: "4 Hayashiji, Ikuno-ku, Osaka-shi, Osaka Prefecture", bedrooms: 3, bathrooms: 2,
    description: "This 3-bedroom, 1-living room, 1-dining room, and 1-kitchen wooden house is 89 years old and is located in Ikuno-ku, Osaka. The house is a leasehold property with a new 20-year lease period. The house is conveniently located near shopping and has public transportation nearby including the JR Osaka Loop Line Teradamachi Station which is a 16-minute walk away.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/922/74286922/74286922_0006.jpg',
    photo_filename: "akiya5.png",
    size_land: 200,
    size_building: 150,
    views: 100
  },
  {
    price: 19029, age: 1983, city: "Nantan", prefecture: "Kyoto",
    address: "Nantan, Kyoto Prefecture", bedrooms: 5, bathrooms: 3,
    description: "This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.",
    user: User.last,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/427/70078427/70078427_0006.jpg',
    photo_filename: "akiya6.png",
    size_land: 200,
    size_building: 50,
    views: 100
  },
  {
    price: 14589, age: 1955, city: "Moriguchi", prefecture: "Osaka",
    address: "Moriguchi City, Osaka Prefecture", bedrooms: 4, bathrooms: 2,
    description: "This 68-year-old house is situated in a tranquil residential neighborhood. It boasts a generous balcony, four Japanese-style rooms (4DK), and is conveniently located near elementary and junior high schools. The property is serviced by public water, public sewer, and individual liquified petroleum gas. While parking is not available, the house's flat layout ensures ease of living.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/021/72401021/72401021_0012.jpg',
    photo_filename: "akiya7.png",
    size_land: 200,
    size_building: 100,
    views: 100
  },
  {
    price: 12686, age: 1969, city: "Hino", prefecture: "Tottori",
    address: "Kurosaka, Hino-cho, Hino-gun, Tottori Prefecture", bedrooms: 5, bathrooms: 3,
    description: "This 5-bedroom, 1-kitchen house is a 5-minute walk from Kurosaka Station on the JR Hoki Line. The 54-year-old wooden building has 2 floors. The Hino River is right in front of the property, offering opportunities for fishing, kayaking, gardening, pottery, or art in the garden. The price has been reduced!.",
    user: User.last,
    photo_url: 'https://image4.homes.jp/smallimg/image.php?file=http%3A%2F%2Fimg.homes.jp%2F135911%2Fsale%2F203%2F2%2F3%2Fievn.jpg&width=1024&height=1024',
    photo_filename: "akiya8.png",
    size_land: 200,
    size_building: 100,
    views: 100
  },
  {
    price: 748493, age: 1992, city: "Osaka", prefecture: "Osaka",
    address: "Higashinakamoto, Higashinari-ku, Osaka-shi, Osaka Prefecture", bedrooms: 5, bathrooms: 2,
    description: "This 5-bedroom, 1-kitchen house is a 5-minute walk from Kurosaka Station on the JR Hoki Line. The 54-year-old wooden building has 2 floors. The Hino River is right in front of the property, offering opportunities for fishing, kayaking, gardening, pottery, or art in the garden. The price has been reduced!.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/432/73110432/73110432_0001.jpg',
    photo_filename: "akiya9.png",
    size_land: 200,
    size_building: 100,
    views: 100
  },
  {
    price: 302569, age: 2021, city: "Nishinomiya", prefecture: "Hyogo",
    address: "Nishinomiya City, Hyogo Prefecture", bedrooms: 4, bathrooms: 2,
    description: "This 5-bedroom, 1-kitchen house is a 5-minute walk from Kurosaka Station on the JR Hoki Line. The 54-year-old wooden building has 2 floors. The Hino River is right in front of the property, offering opportunities for fishing, kayaking, gardening, pottery, or art in the garden. The price has been reduced!.",
    user: User.last,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/238/73351238/73351238_0003.jpg',
    photo_filename: "akiya10.png",
    size_land: 200,
    size_building: 100,
    views: 100
  }
]

properties.each do |attributes|
  property = Property.new(attributes.except(:photo_url, :photo_filename))
  property.photo.attach(io: URI.open(attributes[:photo_url]), filename: attributes[:photo_filename], content_type: "image/png")
  property.save!
  puts "Created property in #{property.city}"
end

puts "Finished!"
