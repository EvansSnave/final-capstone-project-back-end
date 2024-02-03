class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end
end
