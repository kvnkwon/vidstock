# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title "MyString"
    downloads 1
    description "MyText"
    user
  end
end
