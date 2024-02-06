require 'faker'

FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
