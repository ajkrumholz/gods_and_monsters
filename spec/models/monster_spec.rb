require 'rails_helper'

RSpec.describe Monster do
  let(:khorne) { God.create!(name: "Khorne", age: 20, immortal: true)}
  let(:bloodthirster) {khorne.monsters.create!(name: "Bloodthirster", strength_rank: 9.5, flying: true)}

  it 'exists' do
    expect(bloodthirster).to be_a(Monster)
  end

  it 'has a name' do
    expect(bloodthirster.name).to eq("Bloodthirster")
  end

  it 'has a strength rank' do
    expect(bloodthirster.strength_rank).to eq(9.5)
  end

  it 'has can be a flying monster' do
    expect(bloodthirster.flying).to be(true)
  end

  it 'has a god' do
    expect(bloodthirster.god).to be(khorne)
  end
end