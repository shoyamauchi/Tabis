FactoryBot.define do
  factory :user do
    name  {"テストユーザー"}
    sequence(:email) { |n| "exemple#{n}@example.com" }
    password  {"00000000"}
    password_confirmation  {"00000000"}
    id  {"1"}
  end
end
