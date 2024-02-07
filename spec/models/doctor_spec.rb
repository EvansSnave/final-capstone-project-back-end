# spec/models/doctor_spec.rb
require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { create(:doctor) }

  it 'is valid with valid attributes' do
    expect(doctor).to be_valid
  end

  it 'is not valid without a name' do
    doctor.name = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without a description' do
    doctor.description = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without an image_url' do
    doctor.image_url = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid without an age' do
    doctor.age = nil
    expect(doctor).to_not be_valid
  end

  it 'is not valid with an age less than 18' do
    doctor.age = 17
    expect(doctor).to_not be_valid
  end

  it 'belongs to a user' do
    expect(Doctor.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'belongs to a city' do
    expect(Doctor.reflect_on_association(:city).macro).to eq(:belongs_to)
  end

  it 'has one detail' do
    expect(Doctor.reflect_on_association(:detail).macro).to eq(:has_one)
  end

  it 'has many reservations' do
    expect(Doctor.reflect_on_association(:reservations).macro).to eq(:has_many)
  end
end
