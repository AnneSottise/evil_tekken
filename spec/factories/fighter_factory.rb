FactoryBot.define do
  factory :fighter do
    association :character
    association :weapon
  end
end
