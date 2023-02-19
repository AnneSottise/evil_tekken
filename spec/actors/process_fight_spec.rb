require 'rails_helper'

RSpec.describe ProcessFight do
  subject(:actor) { described_class.call(fight: fight) }

  let(:fight) { create :fight }
  let!(:fighter1) { create :fighter, fight: fight }
  let!(:fighter2) { create :fighter, fight: fight }

  it 'creates rounds' do
    expect { actor }.to change { fight.reload.rounds.count }
  end

  it 'saves the winner' do
    winner = actor.winner

    expect(winner.victory).to be_truthy
    expect(winner.experience).to eq(30)
  end

  it 'saves the loser' do
    loser = actor.loser

    expect(loser.victory).to be_falsey
    expect(loser.experience).to eq(10)
  end

  context 'when fighter 1 should win and upgrade level' do
    let!(:fighter1) { create :fighter, fight: fight, character: character1 }
    let!(:fighter2) { create :fighter, fight: fight, character: character2 }

    let!(:character1) do
      create :character, life: 15, attack: 6, defense: 4, level: 1
    end

    let!(:character2) do
      create :character, life: 10, attack: 1, defense: 1, level: 1
    end

    before do
      create :fighter, character: character1, experience: 100
    end

    it 'creates rounds' do
      expect { actor }.to change { fight.reload.rounds.count }
    end

    it 'saves the winner' do
      winner = actor.winner

      expect(winner.id).to eq(character1.id)
      expect(winner.victory).to be_truthy
      expect(winner.experience).to eq(30)
    end

    it 'saves the loser' do
      loser = actor.loser

      expect(loser.id).to eq(character2.id)
      expect(loser.victory).to be_falsey
      expect(loser.experience).to eq(10)
    end

    it 'upgrades the winner level' do
      expect { actor }.to change { character1.reload.level }.by(1)
    end
  end
end
