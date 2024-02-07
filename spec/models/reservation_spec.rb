require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:reservation) { create(:reservation) }

  it 'is valid with valid attributes' do
    expect(reservation).to be_valid
  end

  it 'is not valid without a user' do
    reservation.user = nil
    expect(reservation).to_not be_valid
  end

  it 'is not valid without a doctor' do
    reservation.doctor = nil
    expect(reservation).to_not be_valid
  end

  it 'is not valid without a schedule_date' do
    reservation.schedule_date = nil
    expect(reservation).to_not be_valid
  end

  it 'is not valid with a schedule_date in the past' do
    reservation.schedule_date = Date.yesterday
    expect(reservation).to_not be_valid
  end

  it 'belongs to a user' do
    expect(Reservation.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'belongs to a doctor' do
    expect(Reservation.reflect_on_association(:doctor).macro).to eq(:belongs_to)
  end
end
