FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.user_name }
    location { Faker::Address.country }
    password { Faker::Internet.password(4, 12)}
  end
end
