FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.user_name }
    location { Faker::Address.country }
    password { Faker::Internet.password(4, 12)}
  end

  factory :question do
    title { Faker::Lorem.characters(79)}
    body { Faker::Lorem.paragraph(3, false, 3)}
    user { FactoryGirl.create(:user) }
  end
end
