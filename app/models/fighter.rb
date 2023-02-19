class Fighter < ActiveRecord::Base
  belongs_to :fight
  belongs_to :character
  belongs_to :weapon

  delegate :name, to: :character

  def inital_stats
    {
      id: id,
      life: character.life,
      attack: (character.attack + weapon.attack),
      defense: (character.defense + weapon.defense),
    }
  end
end
