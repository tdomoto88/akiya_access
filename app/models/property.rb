class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos


  has_many :images, dependent: :destroy

  def image_urls
    urls = images.map { |img| img.url }
    photos.each do |photo|
      urls << "https://res.cloudinary.com/dna9z7j4z/image/upload/v1/#{ENV["RAILS_ENV"]}/#{photo.key}"
    end
    urls
  end

  has_many :favourites, dependent: :destroy

  geocoded_by :address

  validates :prefecture, inclusion: { in: ["Aichi", "Akita", "Aomori", "Chiba", "Ehime", "Fukui", "Fukuoka", "Fukushima", "Gifu", "Gunma", "Hiroshima", "Hokkaido", "Hyogo", "Ibaraki", "Ishikawa", "Iwate", "Kagawa", "Kagoshima", "Kanagawa", "Kochi", "Kumamoto", "Kyoto", "Mie", "Miyagi", "Miyazaki", "Nagano", "Nagasaki", "Nara", "Niigata", "Oita", "Okayama", "Okinawa", "Osaka", "Saga", "Saitama", "Shiga", "Shimane", "Shizuoka", "Tochigi", "Tokushima", "Tokyo", "Tottori", "Toyama", "Wakayama", "Yamagata", "Yamaguchi", "Yamanashi"] }
  after_validation :geocode_if_needed

  def geocode_if_needed
      if will_save_change_to_address? && latitude.nil?
          geocode
      end
  end

  # def geocode_property
  #   if latitude.nil? || longitude.nil?
  #     lat_long = geocode
  #     latitude = lat_long.first
  #     longitude = lat_long.last
  #   end
  # end
  #


  def favourited_by(user)
    Favourite.find_by(user: user, property: self)
  end

  def favorite_count
    Favourite.where(property_id: self.id).count
  end

  def view_count
    self.views
  end
end
