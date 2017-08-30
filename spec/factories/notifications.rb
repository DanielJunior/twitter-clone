FactoryGirl.define do
  factory :notification do
    relationship nil
    message "MyString"
    read false
  end
end
