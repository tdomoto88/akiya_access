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
puts "creating users..."

user1 = {first_name: "Sebastian", last_name: "Burke" , dob: "01/03/2002" , email: "sebastian.b@gmail.com", password: "123456" }
user2 = {first_name: "Mamun", last_name: "Jan" , dob: "15/08/2003" , email: "mamun.j@gmail.com", password: "123456" }

[user1, user2].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end

puts "Creating properties..."

property = Property.new(
  price: 19111,
  age: 1983,
  city: "Nagano",
  prefecture: "Kyoto",
  address: "Miyamacho Mitsuno, Nantan, Kyoto 601-0773, Japan",
  bedrooms: 5,
  description: "This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.",
  user: User.first
)

property.photo.attach(io: URI.open('https://miro.medium.com/v2/resize:fit:1100/format:webp/1*MiIHXrnOPuwXCwL3yE3iUA.png'), filename: "akiya.png", content_type: "image/png") # add the file
property.save!
puts "first property done"
property = Property.new(
  price: 11466,

  age: 1926,
  city: "Tokyo",
  prefecture: "Kyoto",

  address: "281 Shimonojō, Fukuchiyama, Kyoto 620-0211, Japan",
  bedrooms: 3,
  description: "This 130-year-old house is nestled in a tranquil residential neighborhood and boasts a detached building and a warehouse. The detached building spans 1,257 square feet, and the property offers ample parking for five kei cars.",
  user: User.last
)

property.photo.attach(io: URI.open('https://tokyoportfolio.com/wp-content/uploads/2023/10/akiyas-in-Japan.jpg'), filename: "akiya2.png", content_type: "image/png")
property.save!
puts "2nd property done"
property = Property.new(
  price: 22296,
  age: 1965,
  city: "Kyoto",
  prefecture: "Kyoto",
  address: "Kyotango, Kyoto 629-3101, Japan",

  bedrooms: 8,
  description: "This 8-bedroom, 1-kitchen house is located in a quiet area near the sea. The wooden, 2-story building is 58 years old and is a short 20-minute walk from Amino Station on the Amino-cho Line.",
  user: User.first)

  property.photo.attach(io: URI.open('https://i0.wp.com/tstoaddicts.com/wp-content/uploads/2017/02/tatami-prison-mount-fuji-painting-simpsons.jpg?ssl=1'), filename: "akiya3.png", content_type: "image/png")
  property.save!

  property = Property.new(
  price: 15858,
  age: 1971,
  city: "Kyoto",
  address: "Tanaka Asukaicho, Kyoto, 606-8304 Japan",
  bedrooms: 1,
  description: "This 1-bedroom condo is located in Tanaka Asukaimachi, Sakyo Ward, Kyoto City, Kyoto Prefecture. The 51-year-old steel-frame building features 1 bedroom, 1 dining room, and 1 kitchen. It is a 6-minute walk from Tanaka Station on the Eizan Electric Railway Eizan Main Line.",
  user: User.first)

  property.photo.attach(io: URI.open('https://img4.athome.jp/image_files/path/_EUvG6gTHD3SpEkJQtucfQ==.jpeg'), filename: "akiya4.png", content_type: "image/png")
  property.save!

  property = Property.new(
  price: 10783,
  age: 1933,
  city: "Osaka",
  address: "4 Hayashiji, Ikuno-ku, Osaka-shi, Osaka Prefecture",
  bedrooms: 3,
  description: "This 3-bedroom, 1-living room, 1-dining room, and 1-kitchen wooden house is 89 years old and is located in Ikuno-ku, Osaka. The house is a leasehold property with a new 20-year lease period. The house is conveniently located near shopping and has public transportation nearby including the JR Osaka Loop Line Teradamachi Station which is a 16-minute walk away.",
  user: User.first
)
property.photo.attach(io: URI.open('https://img01.suumo.com/front/gazo/bukken/060/N010000/img/922/74286922/74286922_0006.jpg'), filename: "akiya5.png", content_type: "image/png") # add the file
property.save!

puts "Finished!"
