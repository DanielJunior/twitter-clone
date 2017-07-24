FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name
    description Faker::Lorem.paragraph
  end
end
