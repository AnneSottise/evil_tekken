require 'reform'

class CharacterForm < Reform::Form
  property :name
  property :life
  property :attack
  property :defense
  property :avatar
  property :level

  validates :name,
            :life,
            :attack,
            :defense,
            :avatar,
            presence: true

  validates :life,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: Character::LIFE_RANGE.min,
              less_than_or_equal_to: Character::LIFE_RANGE.max,
            }

  validates :attack,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: Character::ATTACK_RANGE.min,
              less_than_or_equal_to: Character::ATTACK_RANGE.max,
            }

  validates :defense,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: Character::DEFENSE_RANGE.min,
              less_than_or_equal_to: Character::DEFENSE_RANGE.max,
            }

  validates :level,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: Character::LEVEL_RANGE.min,
              less_than_or_equal_to: Character::LEVEL_RANGE.min,
            }

  validate :balanced_stats

  def balanced_stats
    return if attack.to_i + defense.to_i == Character::BALANCED_STATS_SUM

    errors.add :base, 'Unbalanced character! Sum of attack and defense ' \
                      "should equal #{Character::BALANCED_STATS_SUM}"
  end
end
