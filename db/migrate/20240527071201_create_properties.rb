class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.float :price
      t.integer :age
      t.string :address
      t.integer :bedrooms
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
