class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates_presence_of :user, :schedule_date
  validate :schedule_date_in_future
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :doctor_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :city_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  private

  def schedule_date_in_future
    return unless schedule_date.present? && schedule_date <= Date.today

    errors.add(:schedule_date, 'must be in the future')
  end
end
