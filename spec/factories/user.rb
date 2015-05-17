FactoryGirl.define do
  factory :user do
    name "John"
    sequence(:email) {|n| "john#{n}@mail.com"}
    password "password"
  end
end
