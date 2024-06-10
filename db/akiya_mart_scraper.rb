require "json"
require "open-uri"

filepath = File.join(__dir__, "properties.json")

serialized_properties = File.read(filepath)

properties = JSON.parse(serialized_properties)['results']['listings']

scraper = User.create!(first_name: "Scrape", last_name: "Scrapey", email: "scrape@gmail.com", password: "123456", is_owner: true)

properties.each do |property|
  puts property['prefecture']
  new_property = Property.new(age: property['construction_year'],
  prefecture: property['prefecture'].capitalize,
  price: property['price_foreign'],
  address: property['translated_address'],
  city: 'Nagano',
  bedrooms: 4,
  bathrooms: 2,
  description: 'Great Akiya',
  size_building: 200,
  size_land: 500,
  views: 0,
  property_type: 'Akiya',
  user: scraper)
  new_property.save!
  property['image_urls'].each do |url|
    Image.create(url: url, property: new_property)
  end
end





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
