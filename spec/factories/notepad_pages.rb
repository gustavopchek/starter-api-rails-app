FactoryBot.define do
  factory :notepad_pages do
    name { Faker::Book.title }
    date { Faker::Date }
    content { Faker::Movie.quote }

    association :notepad
  end
end
