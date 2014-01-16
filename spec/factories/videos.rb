# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title "Kitty"
    downloads 1
    description "My cute cats"
    video_link "http://vimeo.com/34009539"
    user
  end
end
