require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate username' do
    create(:user, username: user.username)
    expect(user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:user, email: user.email)
    expect(user).to_not be_valid
  end

  it 'is not valid with an email longer than 255 characters' do
    user.email = "#{'a' * 244}@example.com"
    expect(user).to_not be_valid
  end

  it 'is valid with a properly formatted email' do
    user.email = 'example@domain.com'
    expect(user).to be_valid
  end

  it 'is not valid with improperly formatted emails' do
    invalid_emails = ['example', 'example@domain', 'ex@ample@domain.com']

    invalid_emails.each do |email|
      user.email = email
      expect(user).to_not be_valid
    end
  end

  it 'has many reservations' do
    expect(User.reflect_on_association(:reservations).macro).to eq(:has_many)
  end

  it 'has many doctors' do
    expect(User.reflect_on_association(:doctors).macro).to eq(:has_many)
  end
end
