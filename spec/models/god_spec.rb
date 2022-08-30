require 'rails_helper'

RSpec.describe God do
  before(:each) do
    @khorne = God.create!(name: "Khorne", age: 40, immortal: true)
    @ursun = God.create!(name: "Ursun", age: 20, immortal: false)
    @slaanesh = God.create!(name: "Slaanesh", age: 15, immortal: true)

    @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 9.0, flying: true)

    @elemental_bear = @ursun.monsters.create!(name: "Elemental Bear", strength_rank: 8.5, flying: false)
    @ice_leopard = @ursun.monsters.create!(name: "Ice Leopard", strength_rank: 4.0, flying: false)
    @little_grom = @ursun.monsters.create!(name: "Little Grom", strength_rank: 6.5, flying: false)

    @daemonette = @slaanesh.monsters.create!(name: "Daemonette", strength_rank: 3.5, flying: false)
    @daemon_priestess = @slaanesh.monsters.create!(name: "Daemon Priestess", strength_rank: 9.0, flying: true)
  end

  it 'sorts Gods by number of monsters' do
    expect(God.sort_by_monsters).to eq([@ursun, @slaanesh, @khorne])
  end
end