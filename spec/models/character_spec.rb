require 'rails_helper'

RSpec.describe Character do
  subject(:model) do
    create :character, life: 12, attack: 4, defense: 1, level: level
  end

  let(:level) { 1 }
  let(:weapon1) { create :weapon, name: 'Flamethrower' }
  let(:weapon2) { create :weapon, name: 'Axe' }

  before do
    create :fighter,
           character: model,
           victory: true,
           experience: 30,
           weapon: weapon1

    create :fighter,
           character: model,
           victory: false,
           experience: 10,
           weapon: weapon1

    create :fighter,
           character: model,
           victory: false,
           experience: 10,
           weapon: weapon2
  end

  describe '#wins_count' do
    it { expect(model.wins_count).to eq(1) }
  end

  describe '#win_rate' do
    it { expect(model.win_rate).to eq(33.33) }
  end

  describe '#favorite_weapon' do
    it { expect(model.favorite_weapon).to eq('Axe') }
  end

  describe '#check_level' do
    it 'does nothing' do
      expect { model.check_level }.not_to change { model.reload.level }
    end

    context 'when character is already at level max' do
      let(:level) { 8 }

      it 'does nothing' do
        expect { model.check_level }.not_to change { model.reload.level }
      end
    end

    context 'when character should upgrade level' do
      before do
        create :fighter, character: model, experience: 30
        create :fighter, character: model, experience: 30
      end

      it 'upgrades the character level' do
        expect { model.check_level }.to change { model.reload.level }.by(1)
      end
    end
  end

  describe '#upgrade_level' do
    it 'upgrades the character stats' do
      model.upgrade_level(2)
      model.reload

      expect(model.life).to eq(13)
      expect(model.attack).to eq(5)
      expect(model.defense).to eq(2)
      expect(model.level).to eq(2)
    end
  end
end
