require 'reform'

class FightForm < Reform::Form
  collection :fighters, populate_if_empty: Fighter do
    property :character_id
    property :weapon_id
  end

  validate :two_fighters
  validate :different_fighters

  def two_fighters
    return if fighters.count == 2

    errors.add :base, 'There must be two fighters!'
  end

  def different_fighters
    return if fighters.map(&:character_id).uniq.size == 2

    errors.add :base, 'The fighters must be different!'
  end
end
