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
              in: Weapon::STATS_RANGES[:attack],
            }

  validates :defense,
            numericality: {
              only_integer: true,
              in: Weapon::STATS_RANGES[:defense],
            }
end
