require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { build(:city) }

  it 'is valid with valid attributes' do
    expect(city).to be_valid
  end

  it 'is not valid without a name' do
    city.name = nil
    expect(city).to_not be_valid
  end

  it 'has many doctors' do
    expect(City.reflect_on_association(:doctors).macro).to eq(:has_many)
  end
end
