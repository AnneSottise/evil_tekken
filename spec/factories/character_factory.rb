FactoryBot.define do
  factory :character do
    name { Faker::TvShows::Supernatural.creature }
    life { rand(Character::STATS_RANGES[:life]) }
    attack { rand(Character::STATS_RANGES[:attack]) }
    defense { rand(Character::STATS_RANGES[:defense]) }
  end
end
