FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number:5) }
    text { Faker::Lorem.characters(number:20) }
    value { Faker::Lorem.characters(number:10) }
    user
  end
end