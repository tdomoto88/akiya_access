class AddPhotoUrlToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :photo_url, :string
  end
end
