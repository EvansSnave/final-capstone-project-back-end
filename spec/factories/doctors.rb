require 'faker'

FactoryBot.define do
  factory :doctor do
    association :user
    association :city
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    image_url { Faker::Internet.url }
    age { Faker::Number.between(from: 18, to: 100) }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
