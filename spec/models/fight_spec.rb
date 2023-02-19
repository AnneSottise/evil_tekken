require 'rails_helper'

RSpec.describe Fight do
  subject(:model) { create :fight }

  let!(:fighter1) { create :fighter, fight: subject, victory: true }
  let!(:fighter2) { create :fighter, fight: subject, victory: false }

  describe '#fighter1' do
    it { expect(model.fighter1).to eq(fighter1) }
  end

  describe '#fighter2' do
    it { expect(model.fighter2).to eq(fighter2) }
  end

  describe '#winner' do
    it { expect(model.winner).to eq(fighter1) }
  end

  describe '#loser' do
    it { expect(model.loser).to eq(fighter2) }
  end
end
