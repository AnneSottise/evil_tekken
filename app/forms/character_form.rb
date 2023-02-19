require 'reform'

class CharacterForm < Reform::Form
  property :name
  property :life
  property :attack
  property :defense
  property :avatar

  validates :name,
            :life,
            :attack,
            :defense,
            :avatar,
            presence: true

  validates :life,
            numericality: {
              only_integer: true,
              in: Character::STATS_RANGES[:life],
            }

  validates :attack,
            numericality: {
              only_integer: true,
              in: Character::STATS_RANGES[:attack],
            }

  validates :defense,
            numericality: {
              only_integer: true,
              in: Character::STATS_RANGES[:defense],
            }

  validate :balanced_stats

  def balanced_stats
    return if attack.to_i + defense.to_i == 6

    errors.add :base, 'Unbalanced character! ' \
                      'Sum of attack and defense should equals 6'
  end
end
