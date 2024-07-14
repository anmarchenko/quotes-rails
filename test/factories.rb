# This will guess the User class
FactoryBot.define do
  factory :quote do
    sequence(:name) { |n| "Quote #{n}" }
  end
end
