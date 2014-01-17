# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title "Kitty"
    downloads 1
    description "My cute cats"
    video_link "https://vimeo.com/8743240"
    user
    thumbnail "http://b.vimeocdn.com/ts/116/192/116192229_640.jpg"
  end
end
