require 'rails_helper'

RSpec.describe "Monsters Show Page" do
#   As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

  it 'shows the specified monsters attributes' do
    khorne = God.create!(name: "Khorne", age: 20, immortal: false)
    
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)

    visit "/monsters/#{bloodthirster.id}"

    save_and_open_page
    expect(page).to have_content(bloodthirster.name)
    expect(page).to have_content(bloodthirster.strength_rank)
    expect(page).to have_content(bloodthirster.flying)
    expect(page).to have_content(bloodthirster.god.name)
    expect(page).to have_content(bloodthirster.created_at)
    expect(page).to have_content(bloodthirster.updated_at)
  end
end