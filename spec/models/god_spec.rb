require 'rails_helper'

RSpec.describe God do
  let(:khorne) { God.create(name: "Khorne", age: 20, immortal: true)}
  
  it 'exists' do
    expect(khorne).to be_a(God)
  end

  it 'has no monsters by default' do
    expect(khorne.monsters).to eq([])
  end

  it 'has a name' do
    expect(khorne.name).to eq("Khorne")
  end

  it 'has an age' do
    expect(khorne.age).to be(20)
  end

  it 'can be immortal' do
    expect(khorne.immortal).to be(true)
  end

  it 'can have monsters' do
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    hellhound = khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)

    expect(bloodthirster).to be_a(Monster)
    expect(khorne.monsters).to eq([bloodthirster, hellhound])
  end

  it 'can count monsters' do
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    hellhound = khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)

    expect(khorne.monsters.count).to eq(2)
  end
end