class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates_presence_of :user, :schedule_date
  validate :schedule_date_in_future

  private

  def schedule_date_in_future
    return unless schedule_date.present? && schedule_date <= Date.today

    errors.add(:schedule_date, 'must be in the future')
  end
end
