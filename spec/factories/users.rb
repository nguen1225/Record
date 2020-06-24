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
end