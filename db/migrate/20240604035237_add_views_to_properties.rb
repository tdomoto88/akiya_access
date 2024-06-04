class AddViewsToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :views, :integer
  end
end
