# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "kevin#{n}@mail.com"}
    sequence(:username) {|n| 'kevinssss'}
    password 'password'
  end
end
