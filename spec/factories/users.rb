FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

FactoryBot.define do
  factory :user2 do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user_a, class: User do
    email { 'user_a@example.com' }
    password { 'hogehoge' }
    password_confirmation { 'hogehoge' }
  end

  factory :user_b, class: User do
    email { 'user_b@example.com' }
    trait :invalid do
      email { nil }
      password { nil }
    end
  end
end
