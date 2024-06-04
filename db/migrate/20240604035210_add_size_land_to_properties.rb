class AddSizeLandToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :size_land, :integer
  end
end
