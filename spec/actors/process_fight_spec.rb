require 'rails_helper'

RSpec.describe ProcessFight do
  subject(:actor) { described_class.call(fight: fight) }

  let(:fight) { create :fight }
  let!(:fighter1) { create :fighter, fight: fight }
  let!(:fighter2) { create :fighter, fight: fight }

  it 'creates rounds' do
    expect { actor }.to change { fight.reload.rounds.count }
  end

  context 'when fighter 1 should win' do
    let!(:fighter1) { create :fighter, fight: fight, character: character1 }
    let!(:fighter2) { create :fighter, fight: fight, character: character2 }
    let!(:character1) { create :character, life: 15, attack: 4, defense: 4 }
    let!(:character2) { create :character, life: 10, attack: 1, defense: 1 }

    it 'sets the winner' do
      expect { actor }
        .to change { fight.reload.winner }
        .from(nil)
        .to(fighter1)
    end
  end
end
