require 'httparty'
require 'nokogiri'

class AkiyaAtHomeScraper
  BASE_URL = "https://www.akiya-athome.jp/bukken/search/list/?br_kbn=buy&sbt_kbn=house&pref_cd=40&gyosei_cd%5B%5D=40203&gyosei_cd%5B%5D=40206&gyosei_cd%5B%5D=40210&gyosei_cd%5B%5D=40213&gyosei_cd%5B%5D=40214&gyosei_cd%5B%5D=40215&gyosei_cd%5B%5D=40220&gyosei_cd%5B%5D=40223&gyosei_cd%5B%5D=40226&gyosei_cd%5B%5D=40228&gyosei_cd%5B%5D=40231&gyosei_cd%5B%5D=40383&gyosei_cd%5B%5D=40384&gyosei_cd%5B%5D=40503&gyosei_cd%5B%5D=40610&gyosei_cd%5B%5D=40647&search_type=area&price_from=&price_to=&walk_time=&taten_menseki_from=&taten_menseki_to=&tochi_menseki_from=&tochi_menseki_to=&chiku_year=&freeword=&page=1&search_sort=kokai_date&item_count=100"

  def self.scrape_listings
      html = URI.open(BASE_URL)
      doc = Nokogiri::HTML.parse(html)

      properties = []

      doc.search('.propety').each do |element|
        image_element = element.search('.image img')
        photo_url = image_element.attr('src').value
        photo_url = "https:#{photo_url}" unless photo_url.start_with?('http')
        # p photo_url
        price = element.search('.price').search('span').text.strip
        # p price
        flex = element.search('.flex')
        # p flex
        bedrooms = flex.search('li:nth-child(2)')
        no_of_bedrooms = bedrooms.search('dd').text.strip.to_i
        size_building = flex.search('li:nth-child(3)')
        no_of_size = size_building.search('dd').text.strip.to_i
        size_land = flex.search('li:nth-child(4)')
        no_of_land = size_land.search('dd').text.strip.to_i

        all = element.search('.all')
        age = all.search('li:nth-child(1)')
        no_of_age = age.search('dd').text.strip.to_i
        address = all.search('li:nth-child(2)')
        address_details = address.search('dd').text.strip

        properties << { photo_url: photo_url, price: price, bedrooms: no_of_bedrooms, size_building: no_of_size, size_land: no_of_land, age: no_of_age, address: address_details }

        # puts '---'
      end


      return properties

  end
end
# run rails scraper:akiya_at_home
