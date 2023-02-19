class Character < ActiveRecord::Base
  has_many :fighters, dependent: :nullify
  has_many :fights, through: :fighters

  STATS_RANGES = {
    life: 10..15,
    attack: 1..4,
    defense: 1..4,
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
end
