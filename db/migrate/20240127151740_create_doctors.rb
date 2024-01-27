class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.references :city, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :age

      t.timestamps
    end
  end
end
