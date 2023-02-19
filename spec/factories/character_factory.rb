FactoryBot.define do
  factory :character do
    name { Faker::TvShows::Supernatural.creature }
    life { rand(Character::LIFE_RANGE) }
    attack { rand(Character::ATTACK_RANGE) }
    defense { rand(Character::DEFENSE_RANGE) }
    level { rand(Character::LEVEL_RANGE) }

    trait :with_avatar do
      after(:create) do |weapon, _|
        File.open('db/seeds/freddy.jpg') do |file|
          weapon.avatar = file
          weapon.save!
        end
      end
    end
  end
end
