require 'rails_helper'

RSpec.describe 'The Menagerie of a God' do
  it 'shows all the monsters and their attributes associated with a specific god' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    hellhound = khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)

    visit "/gods/#{khorne.id}/menagerie"

    expect(page).to have_content(bloodthirster.name)
    expect(page).to have_content(bloodthirster.strength_rank)
    expect(page).to have_content(bloodthirster.flying)
    expect(page).to have_content(bloodthirster.god.name)
    expect(page).to have_content(bloodthirster.created_at)
    expect(page).to have_content(bloodthirster.updated_at)
    expect(page).to have_content(hellhound.name)
    expect(page).to have_content(hellhound.strength_rank)
    expect(page).to have_content(hellhound.flying)
    expect(page).to have_content(hellhound.god.name)
    expect(page).to have_content(hellhound.created_at)
    expect(page).to have_content(hellhound.updated_at)
  end
end