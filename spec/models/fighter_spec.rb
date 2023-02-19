require 'rails_helper'

RSpec.describe Fighter do
  subject(:model) { create :fighter, character: character, weapon: weapon }

  let(:character) { create :character, life: 12, attack: 5, defense: 2 }
  let(:weapon) { create :weapon, attack: 2, defense: 1 }

  describe '#inital_stats' do
    let(:expected_hash) do
      {
        id: model.id,
        life: 12,
        attack: 7,
        defense: 3,
      }
    end

    it { expect(model.inital_stats).to eq(expected_hash) }
  end
end
