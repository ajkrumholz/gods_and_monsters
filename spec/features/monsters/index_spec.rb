require 'rails_helper'

RSpec.describe 'Monster Index Page' do
  it 'displays the name of all monsters' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    ursun = God.create(name: "Ursun", age: 20, immortal: false)
    slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)

    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    hellhound = khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
    elemental_bear = ursun.monsters.create!(name: "Elemental Bear", strength_rank: 7.0, flying: false)
    daemonette = slaanesh.monsters.create!(name: "Daemonette", strength_rank: 3.5, flying: false)
    daemon_priestess = slaanesh.monsters.create!(name: "Daemon Priestess", strength_rank: 9.0, flying: true)

    visit '/monsters/'

    expect(page).to have_content(bloodthirster.name)
    expect(page).to have_content(hellhound.name)
    expect(page).to have_content(elemental_bear.name)
    expect(page).to have_content(daemonette.name)
    expect(page).to have_content(daemon_priestess.name)
  end

  it 'links to home, gods, and monsters' do
    visit "/monsters/"

    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end
end