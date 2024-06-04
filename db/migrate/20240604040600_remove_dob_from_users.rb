class RemoveDobFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :dob, :date
  end
end
