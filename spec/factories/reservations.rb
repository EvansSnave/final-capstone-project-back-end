require 'faker'

FactoryBot.define do
  factory :reservation do
    association :user
    association :doctor
    schedule_date { Faker::Date.forward(days: 23) }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
