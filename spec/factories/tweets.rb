FactoryGirl.define do
  factory :tweet do
    content "My tweet"

    factory :invalid_tweet do
      content Faker::Lorem.paragraph(10)
    end
  end

end
