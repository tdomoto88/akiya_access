namespace :scraper do
  desc "Scrape data"
  task akiya_at_home: :environment do
    puts "Scraping Akiya at home..."
    require_relative 'akiya_at_home_scraper'

    properties = AkiyaAtHomeScraper.scrape_listings
    p properties

    # rake task will return when all jobs are _enqueued_ (not done).
  end
end
