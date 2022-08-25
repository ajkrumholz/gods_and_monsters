require 'rails_helper'

RSpec.describe "Monsters Show Page" do
#   As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

  it 'shows the specified monsters attributes' do
    khorne = God.create!(name: "Khorne", age: 20, immortal: false)
    
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)

    visit "/monsters/#{bloodthirster.id}"

    expect(page).to have_content(bloodthirster.name)
    expect(page).to have_content(bloodthirster.strength_rank)
    expect(page).to have_content(bloodthirster.flying)
    expect(page).to have_content(bloodthirster.god.name)
    expect(page).to have_content(bloodthirster.created_at)
    expect(page).to have_content(bloodthirster.updated_at)
  end

  it 'links to home, gods, and monsters' do
    khorne = God.create!(name: "Khorne", age: 20, immortal: false)
    
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)

    visit "/monsters/#{bloodthirster.id}"

    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end
end