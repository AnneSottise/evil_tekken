FactoryBot.define do
  factory :weapon do
    name { Faker::JapaneseMedia::Conan.gadget }
    attack { rand(Weapon::STATS_RANGES[:attack]) }
    defense { rand(Weapon::STATS_RANGES[:defense]) }
  end
end
