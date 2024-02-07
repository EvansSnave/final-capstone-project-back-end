require 'faker'

FactoryBot.define do
  factory :detail do
    price { Faker::Number.between(from: 0, to: 1000) }
    specialization { Faker::Job.field }
    studies { Faker::Educator.degree }
    association :doctor
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
