class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.date :schedule_date

      t.timestamps
    end

    add_index :reservations, [:user_id, :doctor_id, :schedule_date], unique: true, name: 'unique_reservation_index'
  end
end
