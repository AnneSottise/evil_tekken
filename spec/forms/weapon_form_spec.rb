require 'rails_helper'

RSpec.describe WeaponForm do
  subject(:form) { described_class.new(weapon) }

  let(:weapon) { create :weapon, :with_avatar }

  it 'validates' do
    expect(form.validate({})).to be_truthy
  end

  context 'with out of range stats' do
    it 'does not validate' do
      expect(form.validate(attack: 20, defense: 20)).to be_falsey
      expect(form.errors.full_messages.size).to eq(2)
    end
  end
end
