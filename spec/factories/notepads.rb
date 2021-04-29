FactoryBot.define do
  factory :notepad do
    name { Faker::Book.title }
  end
end
