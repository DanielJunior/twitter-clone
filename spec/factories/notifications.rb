FactoryGirl.define do
  factory :notification do
    message "MyString"
    user nil
    read false
  end
end
