class AddPrefectureToProperty < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :prefecture, :string
  end
end
