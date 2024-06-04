class AddSizeBuildingToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :size_building, :integer
  end
end
