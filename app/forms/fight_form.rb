require 'reform'

class FightForm < Reform::Form
  collection :fighters, populate_if_empty: Fighter do
    property :character_id
    property :weapon_id

    validates :character_id, :weapon_id, presence: true
  end

  validate :different_fighters

  def different_fighters
    return if fighters.map(&:character_id).uniq.size == 2

    errors.add :base, 'The fighters must be different!'
  end
end
