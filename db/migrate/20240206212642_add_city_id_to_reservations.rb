class AddCityIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :city_id, :integer, null: false
  end
end
