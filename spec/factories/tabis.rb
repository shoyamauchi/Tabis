FactoryBot.define do
  factory :tabi do
    sequence(:id) { |n| "#{n}" }
    sequence(:title) { |n| "#{n}の旅" }
    content  {"a"}
    start_date  { "Date.now" }
    address  { "東京駅" }
    association :user
  end
end
