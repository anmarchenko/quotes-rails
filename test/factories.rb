# This will guess the User class
FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }
  end

  factory :quote do
    sequence(:name) { |n| "Quote #{n}" }
    company
  end
end
