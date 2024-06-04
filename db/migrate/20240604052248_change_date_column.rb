class ChangeDateColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :consultations, :date, :datetime

  end
end
