FactoryBot.define do
  factory :fighter do
    association :fight
    association :character
    association :weapon
  end
end
