class Fight < ActiveRecord::Base
  ATTACK_MODIFICATOR_RANGE = (-20..20).freeze
  MINIMUM_EXPERIENCE_BONUS = 10
  WINNING_EXPERIENCE_BONUS = 20
  MAX_ROUNDS = 100

  has_many :fighters, dependent: :destroy
  has_many :weapons, through: :fighters
  has_many :characters, through: :fighters
  has_many :rounds, dependent: :destroy

  accepts_nested_attributes_for :fighters

  def fighter1
    fighters.first
  end

  def fighter2
    fighters.last
  end

  def winner
    fighters.find_by(victory: true)
  end

  def loser
    fighters.find_by(victory: false)
  end
end
