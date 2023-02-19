require 'rails_helper'

RSpec.describe CharacterForm do
  subject(:form) { described_class.new(character) }

  let(:character) do
    create :character, :with_avatar, life: 12, attack: 5, defense: 2, level: 1
  end

  it 'validates' do
    expect(form.validate({})).to be_truthy
  end

  context 'with out of range stats' do
    it 'does not validate' do
      expect(
        form.validate(life: 20, attack: 20, defense: 20, level: 20),
      ).to be_falsey

      expect(form.errors.full_messages.size).to eq(5)
    end
  end

  context 'when attack and defense are not balanced' do
    it 'does not validate' do
      expect(
        form.validate(attack: 6, defense: 4),
      ).to be_falsey

      expect(form.errors.full_messages).to eq(
        ['Unbalanced character! Sum of attack and defense should equal 7'],
      )
    end
  end
end
