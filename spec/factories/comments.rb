FactoryBot.define do
  factory :comment do
    author
    post
    content Faker::Lorem.sentence
  end
end
