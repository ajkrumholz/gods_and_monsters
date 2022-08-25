require 'rails_helper'

RSpec.describe God do
  let(:khorne) { God.create(name: "Khorne", age: 20, immortal: true)}
  
  it 'exists' do
    expect(khorne).to be_a(God)
  end

  it 'has no monsters by default' do
    expect(khorne.monsters).to eq([])
  end

  it 'can have monsters' do
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    hellhound = khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)

    expect(khorne.monsters).to eq([bloodthirster, hellhound])
  end

  it 'can count monsters' do
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    hellhound = khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)

    expect(khorne.monsters.count).to eq(2)
  end
end