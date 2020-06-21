FactoryBot.define do
  factory :contact do
    email { Faker::Lorem.characters(number:5) }
    message { Faker::Lorem.characters(number:20) }
    user
  end
end