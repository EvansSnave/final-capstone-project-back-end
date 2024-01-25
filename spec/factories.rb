FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2024-01-25 12:55:09" }
  end

  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
