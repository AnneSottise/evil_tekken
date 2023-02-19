# frozen_string_literal: true
module ApplicationHelper
  def characters_collection
    Character.all.shuffle.map do |character|
      ["#{character.name} (LVL #{character.level})", character.id]
    end
  end

  def weapons_collection
    Weapon.all.shuffle.map do |weapon|
      [weapon.name, weapon.id]
    end
  end

  def format_win_rate(rate)
    return if rate.blank?

    number_to_percentage(
      rate,
      strip_insignificant_zeros: true,
    )
  end
end
