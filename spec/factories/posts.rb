FactoryBot.define do
  factory :post do
    author
    title Faker::Lorem.sentence
    content Faker::Lorem.sentence(10)
  end
end
