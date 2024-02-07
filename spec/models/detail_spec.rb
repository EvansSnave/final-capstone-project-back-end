# spec/models/detail_spec.rb
require 'rails_helper'

RSpec.describe Detail, type: :model do
  let(:detail) { build(:detail) }

  it 'is valid with valid attributes' do
    expect(detail).to be_valid
  end

  it 'is not valid without a price' do
    detail.price = nil
    expect(detail).to_not be_valid
  end

  it 'is not valid with a negative price' do
    detail.price = -1
    expect(detail).to_not be_valid
  end

  it 'is not valid without a specialization' do
    detail.specialization = nil
    expect(detail).to_not be_valid
  end

  it 'is not valid with a specialization longer than 70 characters' do
    detail.specialization = 'a' * 71
    expect(detail).to_not be_valid
  end

  it 'is not valid without studies' do
    detail.studies = nil
    expect(detail).to_not be_valid
  end

  it 'is not valid with studies longer than 150 characters' do
    detail.studies = 'a' * 151
    expect(detail).to_not be_valid
  end

  it 'belongs to a doctor' do
    expect(Detail.reflect_on_association(:doctor).macro).to eq(:belongs_to)
  end
end
