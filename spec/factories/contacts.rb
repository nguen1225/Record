FactoryBot.define do
  # factory :contact do
  #   email { Faker::Internet.email }
  #   message { Faker::Lorem.characters(number:20) }
  #   user
  # end

  factory :contact do
    user_id { 1 }
    email { 'hogehoge@gmail.com' }
    message { 'テストテスト' }
  end

  #   factory :contact do
  #   user_id { 1 }
  #   email { "MyString" }
  #   message { "MyString" }
  # end
end
