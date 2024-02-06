require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should allow_value('example@domain.com').for(:email) }
    it { should_not allow_value('example').for(:email) }
    it { should_not allow_value('example@domain').for(:email) }
    it { should_not allow_value('ex@ample@domain.com').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:reservations) }
    it { should have_many(:doctors) }
  end
end
