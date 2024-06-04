class AddBathroomsToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :bathrooms, :integer
  end
end
