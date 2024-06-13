require "json"
require "open-uri"

filepath = File.join(__dir__, "properties.json")

serialized_properties = File.read(filepath)

properties = JSON.parse(serialized_properties)['results']['listings']

scraper = User.create!(first_name: "Scrape", last_name: "Scrapey", email: "scrape@gmail.com", password: "123456", is_owner: true)
User.create!(first_name: "Hugh", last_name: "Clayton", email: "hughgrassbyclayton@hotmail.com", password: "123456", is_owner: false)
User.create!(first_name: "Tsuyoshi", last_name: "Domoto", email: "tdomoto88@gmail.com", password: "123456", is_owner: false)
User.create!(first_name: "Lance", last_name: "Masina", email: "lance@lancemasina.com", password: "123456", is_owner: false)
User.create!(first_name: "Xavier", last_name: "Ropero", email: "xavier.ropero@gmail.com", password: "123456", is_owner: false)
puts properties.count
properties_skipped = 0
properties.each_with_index do |property, index|
  puts index
  url = "https://www.akiya-mart.com/listings/id/#{property['listing_id']}?currency=usd"
  serialized_details = URI.open(url).read
  details = JSON.parse(serialized_details)['results']
  puts property['prefecture']

  geocoded_city = Geocoder.search([details['lat'], details['lon']])
  if geocoded_city.empty?
    puts "skipped.."
    properties_skipped += 1
    next
  end

  new_property = Property.new(age: property['construction_year'],
  prefecture: property['prefecture'].capitalize,
  price: property['price_foreign'],
  address: property['translated_address'],
  latitude: details['lat'],
  longitude: details['lon'],
  city: geocoded_city.first.city,
  bedrooms: rand(1..6),
  bathrooms: rand(1..3),
  description: details['llm_description'],
  size_building: details['building_area'].to_i,
  size_land: details['land_area'].to_i,
  views: 0,
  property_type: 'Akiya',
  user: scraper)
  new_property.save!
  property['image_urls'].each do |url|
    Image.create(url: url, property: new_property)
  end
end

puts "properties skipped: #{properties_skipped}"




# curl = "https://www.allakiyas.com/properties.php?location=Kyoto+Fu&for-sale=on&building-type=&display_style=list&sort_by="

# html = URI.open(url).read

# doc = Nokogiri::HTML.parse(html)

# properties = []

# doc.search('.container.pad-right').each do |element|
#   price = element.search('.nowrap').first.text.strip
#   address = element.search('.pad-bottom .translated').text.strip
#   pricing = element.search('.pricing')
#   land = pricing.search('tr:nth-child(2) td').text.strip

#   properties << { price: price, address: address, land: land}
# end

# p properties
