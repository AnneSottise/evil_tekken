class Character < ActiveRecord::Base
  has_many :fighters, dependent: :nullify
  has_many :fights, through: :fighters

  BALANCED_STATS_SUM = 7

  LIFE_RANGE = (10..15).freeze
  ATTACK_RANGE = (1..6).freeze
  DEFENSE_RANGE = (1..4).freeze
  LEVEL_RANGE = (1..8).freeze

  LEVEL_RANGES = {
    '1' => 0..100,
    '2' => 101..200,
    '3' => 201..300,
    '4' => 301..500,
    '5' => 501..800,
    '6' => 801..1_300,
    '7' => 1_301..2_100,
    '8' => 2_101..Float::INFINITY,
  }.freeze

  mount_uploader :avatar, AvatarUploader

  def wins_count
    fighters.where(victory: true).count
  end

  def win_rate
    (wins_count * 100).fdiv(fights.count).round(2)
  end

  def favorite_weapon
    fighters
      .group_by(&:weapon)
      .max { |_fight, weapons| weapons.count }
      &.first
      &.name
  end

  def experience
    fights.sum(:experience)
  end

  def check_level
    return if level == LEVEL_RANGE.max

    reached_level =
      LEVEL_RANGES.find do |_level, range|
        range.cover? experience
      end.first.to_i

    return if level == reached_level

    upgrade_level(reached_level)
  end

  def upgrade_level(reached_level)
    update(
      level: reached_level,
      life: life + 1,
      attack: attack + 1,
      defense: defense + 1,
    )
  end
end
