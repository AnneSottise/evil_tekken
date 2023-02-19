class Fight < ActiveRecord::Base
  ATTACK_MODIFICATOR_RANGE = (-20..20).freeze

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
end
