class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.date :schedule_date

      validates_presence_of :user, :doctor, :schedule_date, :city
      validate :schedule_date_in_future

      private

      def schedule_date_in_future
        if schedule_date.present? && schedule_date <= Date.today
          errors.add(:schedule_date, "must be in the future")
        end
      end

      t.timestamps
    end
  end
end
