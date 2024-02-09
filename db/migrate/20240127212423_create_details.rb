class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.integer :price
      t.string :specialization
      t.string :studies
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
