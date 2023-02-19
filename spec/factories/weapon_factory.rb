FactoryBot.define do
  factory :weapon do
    name { Faker::JapaneseMedia::Conan.gadget }
    attack { rand(Weapon::STATS_RANGES[:attack]) }
    defense { rand(Weapon::STATS_RANGES[:defense]) }

    trait :with_avatar do
      after(:create) do |weapon, _|
        File.open('db/seeds/machete.png') do |file|
          weapon.avatar = file
          weapon.save!
        end
      end
    end
  end
end
