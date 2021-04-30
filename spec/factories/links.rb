FactoryBot.define do
  factory :link do
    original_url { Faker::Internet.url }
    shortened_url { Faker::Internet.url }
    password { Faker::Lorem.word }
  end
end
