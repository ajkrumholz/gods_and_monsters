require 'rails_helper'

RSpec.describe Monster do
  before(:each) do
    @khorne = God.create(name: "Khorne", age: 40, immortal: true)
    @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 9.0, flying: true)
    @hellhound = @khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
    @chaos_furies = @khorne.monsters.create!(name: "Chaos Furies", strength_rank: 3.5, flying: true)
  end
  
  it 'can display monsters above a given strength rank' do
    expect(Monster.all.display_by_str(@khorne, 5)).to eq([@bloodthirster, @hellhound])
  end
end