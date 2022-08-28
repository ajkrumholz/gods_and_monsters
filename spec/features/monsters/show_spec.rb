require 'rails_helper'

RSpec.describe "Monsters Show Page" do
#   As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:
  before(:each) do
    @khorne = God.create!(name: "Khorne", age: 20, immortal: false)
    @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    visit "/monsters/#{@bloodthirster.id}"
  end

  it 'shows the specified monsters attributes' do
    expect(page).to have_content(@bloodthirster.name)
    expect(page).to have_content(@bloodthirster.strength_rank)
    expect(page).to have_content(@bloodthirster.flying)
    expect(page).to have_content(@bloodthirster.god.name)
    expect(page).to have_content(@bloodthirster.created_at)
    expect(page).to have_content(@bloodthirster.updated_at)
  end

  it 'links to home, gods, and monsters' do
    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  it 'links to monsters#edit' do
    expect(page).to have_link("Update #{@bloodthirster.name}", :href => "/monsters/#{@bloodthirster.id}/edit")
  end

  it 'links to monster#destroy' do
    expect(page).to have_link("Delete #{@bloodthirster.name}", href: "/monsters/#{@bloodthirster.id}")

    click_link("Delete #{@bloodthirster.name}")

    expect(page).to have_current_path("/monsters")
    expect(page).to_not have_link("#{@bloodthirster.name}", href: "/monsters/#{@bloodthirster.id}")
  end
end