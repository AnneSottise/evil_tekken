require 'reform'

class WeaponForm < Reform::Form
  property :name
  property :attack
  property :defense
  property :avatar

  validates :name,
            :attack,
            :defense,
            :avatar,
            presence: true

  validates :attack,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: Weapon::STATS_RANGES[:attack].min,
              less_than_or_equal_to: Weapon::STATS_RANGES[:attack].max,
            }

  validates :defense,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: Weapon::STATS_RANGES[:defense].min,
              less_than_or_equal_to: Weapon::STATS_RANGES[:defense].max,
            }
end
