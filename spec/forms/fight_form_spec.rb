require 'rails_helper'

RSpec.describe FightForm do
  subject(:form) { described_class.new(fight) }

  let(:fight) { create :fight }

  let(:fighters) do
    [{ character_id: 1, weapon_id: 2 }, { character_id: 1, weapon_id: 4 }]
  end

  it 'does not validate' do
    expect(form.validate(fighters: fighters)).to be_falsey

    expect(form.errors.full_messages).to eq(['The fighters must be different!'])
  end
end
