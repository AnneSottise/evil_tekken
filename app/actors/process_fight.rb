class ProcessFight < Actor
  input :fight,
        type: Fight,
        must: {
          not_have_winner: ->(fight) { fight.winner.blank? },
          have_2_fighters: ->(fight) { fight.fighters.size == 2 },
          have_2_weapons: ->(fight) { fight.weapons.size == 2 },
        }

  output :winner, allow_nil: true

  def call
    round = 1

    until winner.present?
      round += 1
      attacker, defenser = set_attacker_and_defenser
      damage = inflict_damage(attacker, defenser)
      record_round(attacker, defenser, round, damage)

      # Should we allow a fight to end without a winner?
      # Or should we work more on characters stats to ensure a winner?
      break if round >= 100
    end

    record_victory
  end

  private

  def set_attacker_and_defenser
    attacker, defenser =
      if fighter1.attacker
        [fighter2, fighter1]
      else
        [fighter1, fighter2]
      end

    fighter1.attacker = (attacker == fighter1)
    fighter2.attacker = (attacker == fighter2)

    [attacker, defenser]
  end

  def inflict_damage(attacker, defenser)
    damage = compute_damage(attacker.attack, defenser.defense)
    defenser.life -= damage

    result.winner = attacker if defenser.life <= 0

    damage
  end

  def compute_damage(attack, defense)
    damage = modified_attack(attack) - defense

    return damage if damage.positive?

    0
  end

  def modified_attack(attack)
    percentage = 1 + rand(Fight::ATTACK_MODIFICATOR_RANGE).fdiv(100)

    (attack * percentage).round(2)
  end

  def record_round(attacker, defenser, round, damage)
    Round.create!(
      fight: fight,
      attacker_id: attacker.id,
      defenser_id: defenser.id,
      position: round,
      damage: damage,
      defenser_life: defenser.life,
    )
  end

  def record_victory
    return if winner.blank?

    Fighter.find(winner.id).update(victory: true)
  end

  def fighter1
    @fighter1 ||= OpenStruct.new(
      attacker: [false, true].shuffle,
      **fight.fighter1.inital_stats,
    )
  end

  def fighter2
    @fighter2 ||= OpenStruct.new(
      attacker: !fighter1.attacker,
      **fight.fighter2.inital_stats,
    )
  end
end
