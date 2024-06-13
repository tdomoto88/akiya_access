require 'nokogiri'
require 'json'
require 'easy_translate'
require 'open-uri'

class AkiyaAtHomeScraper
  def self.scrape_listings
    urls = [
      "https://www.akiya-athome.jp/buy/28/?br_kbn=buy&pref_cd=28&page=1&search_sort=kokai_date&item_count=100",
      "https://www.akiya-athome.jp/buy/26/?br_kbn=buy&pref_cd=26&page=1&search_sort=kokai_date&item_count=100",
      "https://www.akiya-athome.jp/buy/27/",
      "https://www.akiya-athome.jp/buy/25/?br_kbn=buy&pref_cd=25&page=1&search_sort=kokai_date&item_count=100",
      "https://www.akiya-athome.jp/buy/30/?br_kbn=buy&pref_cd=30&page=1&search_sort=kokai_date&item_count=50",
      "https://www.akiya-athome.jp/buy/29/?br_kbn=buy&pref_cd=29&page=1&search_sort=kokai_date&item_count=100"
    ]
    scrape_from_urls(urls)
  end

  def self.scrape_from_urls(urls)
    properties = []

    urls.each_with_index do |url, index|
      puts "Scraping URL #{index + 1} of #{urls.size}"
      html = URI.open(url).read
      properties += scrape_page(html)
    end

    properties
  end

  private

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

  def self.scrape_page(html)
    doc = Nokogiri::HTML.parse(html)
    properties = doc.search('.propety')
    counter = 0

    properties.map do |element|
      counter += 1
      puts "Mapping property ##{counter}/#{properties.size}"

      image_element = element.search('img')
      photo_url = image_element.attr('src').value
      photo_url = "https:#{photo_url}" unless photo_url.start_with?('http')

      price = element.search('.price').search('span').text.strip
      price_usd = jpy_to_usd(price)

      flex = element.search('.flex')
      bedrooms = flex.search('li:nth-child(2) dd').text.strip.to_i
      size_building = flex.search('li:nth-child(3) dd').text.strip.to_i
      size_land = flex.search('li:nth-child(4) dd').text.strip.to_i

      all = element.search('.all')
      age = all.search('li dt:contains("築年月")+dd').text.strip.to_i
      address = all.search('li dt:contains("所在地")+dd').text.strip

      address = translate(address, :ja, :en)

      city = extract_city(address).capitalize
      prefecture = extract_prefecture(address).capitalize

      akiya_at_home_scraper = nil
      begin
        akiya_at_home_scraper = User.create!(first_name: "Scrappy", last_name: "Scrap", email: "aah@gmail.com", password: "123456", is_owner: true)
      rescue
        akiya_at_home_scraper = User.find_by(email: "aah@gmail.com")
      end
      # p akiya_at_home_scraper



      Property.create!(
        photo_url: photo_url,
        price: price_usd,
        bedrooms: bedrooms,
        bathrooms: rand(1..4),
        size_building: size_building,
        size_land: size_land,
        age: age,
        address: address,
        views: 0,
        city: city,
        prefecture: prefecture,
        property_type: "Akiya",
        user: akiya_at_home_scraper
      )
    end

    properties

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
