class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :favourites
  has_many :images

  def image_urls
    urls = images.map { |img| img.url }
    photos.each do |photo|
      urls << "https://res.cloudinary.com/dna9z7j4z/image/upload/v1/#{ENV["RAILS_ENV"]}/#{photo.key}"
    end
    urls
  end


  geocoded_by :address

  validates :prefecture, inclusion: { in: ["Hokkaido", "Aomori", "Iwate", "Miyagi", "Akita", "Yamagata", "Fukushima", "Ibaraki", "Tochigi", "Gunma", "Saitama", "Chiba", "Tokyo", "Kanagawa", "Niigata", "Toyama", "Ishikawa", "Fukui", "Yamanashi", "Nagano", "Gifu", "Shizuoka", "Aichi", "Mie", "Shiga", "Kyoto", "Osaka", "Hyogo", "Nara", "Wakayama", "Tottori", "Shimane", "Okayama", "Hiroshima", "Yamaguchi", "Tokushima", "Kagawa", "Ehime", "Kochi", "Fukuoka", "Saga", "Nagasaki", "Kumamoto", "Oita", "Miyazaki", "Kagoshima", "Okinawa"] }
  after_validation :geocode, if: :will_save_change_to_address?

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
