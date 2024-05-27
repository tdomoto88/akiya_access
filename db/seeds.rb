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

new_property1 = {price: 19.111, age: 1983, address: "Miyamacho Mitsuno, Nantan, Préfecture de Kyoto 601-0773, Japon", bedrooms: 5, description: "This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.", user: User.first}
new_property2 =  {price: 11.466, age: 1926, address: "281 Shimonojō, Fukuchiyama, Kyoto 620-0211, Japon", bedrooms: 3, description: "This 130-year-old house is nestled in a tranquil residential neighborhood and boasts a detached building and a warehouse. The detached building spans 1,257 square feet, and the property offers ample parking for five kei cars.", user: User.last}
new_property3 =  {price: 22.296, age: 1965,  address: "Aminocho Amino, Kyotango, Kyoto, Japon", bedrooms: 8, description: "This 8-bedroom, 1-kitchen house is located in a quiet area near the sea. The wooden, 2-story building is 58 years old and is a short 20-minute walk from Amino Station on the Amino-cho Line.", user: User.first }

[new_property1, new_property2, new_property3].each do |attributes|
  property = Property.create!(attributes)
  puts "Created #{property.address}"
end


puts "Finished!"
