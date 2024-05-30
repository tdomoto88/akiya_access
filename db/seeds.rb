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
  price: 19.111,
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

property = Property.new(
  price: 11.466,
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

property = Property.new(
  price: 22.296,
  age: 1965,
  city: "Kyoto",
  prefecture: "Kyoto",
  address: "Kyotango, Kyoto 629-3101, Japan",
  bedrooms: 8,
  description: "This 8-bedroom, 1-kitchen house is located in a quiet area near the sea. The wooden, 2-story building is 58 years old and is a short 20-minute walk from Amino Station on the Amino-cho Line.",
  user: User.first)

  property.photo.attach(io: URI.open('https://i0.wp.com/tstoaddicts.com/wp-content/uploads/2017/02/tatami-prison-mount-fuji-painting-simpsons.jpg?ssl=1'), filename: "akiya3.png", content_type: "image/png")
  property.save!


puts "Finished!"
