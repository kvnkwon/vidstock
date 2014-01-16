# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title "Kitty"
    downloads 1
    description "My cute cats"
  end
end
