FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name
    description Faker::Lorem.paragraph
    email Faker::Internet.email
    password "123456"
    password_confirmation "123456"

    factory :another_user do
      name Faker::Name.first_name
      description Faker::Lorem.paragraph
      email Faker::Internet.email
      password "123456"
      password_confirmation "123456"
      after(:build) do |instance|
        10.times {instance.tweets << FactoryGirl.create(:tweet, user: instance)}
      end
      after(:create) {|instance|
        instance.tweets.each {|tweet| tweet.save!}
      }
    end
  end
end
