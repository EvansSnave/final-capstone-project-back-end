FactoryBot.define do
  factory :detail do
    
  end

  factory :doctor do
    
  end

  factory :city do
    
  end

  factory :reservation do
    
  end

  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
