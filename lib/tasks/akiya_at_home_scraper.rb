require 'nokogiri'
require 'json'
require 'easy_translate'

class AkiyaAtHomeScraper
  BASE_URL = "https://www.akiya-athome.jp/buy/28/?br_kbn=buy&pref_cd=28&page=1&search_sort=kokai_date&item_count=100"
  # DEEPL_API_KEY = 'becc7235-ae83-4c6f-942a-4a8d3cd9cde1:fx'

  def self.scrape_listings
      html = URI.open(BASE_URL).read unless File.exist?(File.join(__dir__, 'akiya_at_home.html'))
      File.write(File.join(__dir__, 'akiya_at_home.html'), html)
      doc = Nokogiri::HTML.parse(html)
      # debugger
      properties = doc.search('.propety')
      counter = 0
      properties.map do |element|
        counter += 1
        puts "mapping property ##{counter}/#{properties.size}"
        image_element = element.search('img')
        photo_url = image_element.attr('src').value
        photo_url = "https:#{photo_url}" unless photo_url.start_with?('http')
        # p photo_url
        price = element.search('.price').search('span').text.strip
        price_usd = jpy_to_usd(price)
        # p price
        flex = element.search('.flex')
        # p flex
        bedrooms = flex.search('li:nth-child(2) dd').text.strip.to_i
        size_building = flex.search('li:nth-child(3) dd').text.strip.to_i
        size_land = flex.search('li:nth-child(4) dd').text.strip.to_i
        all = element.search('.all')
        age = all.search('li dt:contains("築年月")+dd').text.strip.to_i
        address = all.search('li dt:contains("所在地")+dd').text.strip

        # translated_address = translate_text(address_details)
        address = translate(address, :ja, :en)

        city = extract_city(address).capitalize
        prefecture = extract_prefecture(address).capitalize

        Property.create(
          photo_url: photo_url,
          price: price_usd,
          bedrooms: bedrooms,
          size_building: size_building,
          size_land: size_land,
          age: age,
          address: address,
          city: city,
          prefecture: prefecture
        )
      end
      return properties
  end

  private

  def self.translate(text, from, to)
    EasyTranslate.api_key = "AIzaSyDd8pRatE4c1BvOrjo9xxDrkwHHm0izakk"
    EasyTranslate.translate(text, from:, to:)
  end

  def self.extract(text, pattern)
    text.downcase!
    text.split(pattern).first.split(",").last.strip
  end

  def self.extract_city(text)
    text.downcase!
      if text.include?("city")
        extract(text, "city")
      elsif text.include?("town")
        extract(text, "town")
      elsif text.include?("village")
        extract(text, "village")
      else
        text
      end
  end

  def self.extract_prefecture(text)
    extract(text, "prefecture")
  end

  def self.jpy_to_usd(price_jpy)
    exchange_rate = 0.0064
    (price_jpy.to_i * exchange_rate * 10_000).to_i
  end
end
