require 'rails_helper'

RSpec.describe City, type: :model do
  subject { build(:city) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:doctors) }
  end
end
