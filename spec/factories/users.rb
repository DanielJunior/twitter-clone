FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name
    description Faker::Lorem.paragraph
    email Faker::Internet.email
    password "123456"
  end
end
