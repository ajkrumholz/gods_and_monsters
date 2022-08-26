require "rails_helper"

RSpec.describe "Monster Update Page" do
  before(:each) do
    @khorne = God.create!(name: "Khorne", age: 20, immortal: false)
    @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    visit "/monsters/#{@bloodthirster.id}/edit"
  end

  it 'links to home, gods, and monsters' do
    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  it 'contains a form to update monster attributes' do
    expect(page).to have_field(:name, with: @bloodthirster.name)
    expect(page).to have_field(:strength_rank, with: @bloodthirster.strength_rank)
    expect(page).to have_field(:flying_true)
    expect(page).to have_field(:flying_false)
    expect(page).to have_button("Update #{@bloodthirster.name}")
  end

  it 'updates the monster and redirects to its show page' do
    fill_in(:name, with: "Bloodthirster")
    fill_in(:strength_rank, with: "8.5")
    choose(:flying_true)
    click_on("Update #{@bloodthirster.name}")
    @monster = @khorne.monsters.order(:updated_at).last

    expect(@monster.name).to eq("Bloodthirster")
    expect(@monster.strength_rank).to eq(8.5)
    expect(@monster.flying).to eq(true)
    expect(page).to have_current_path("/monsters/#{@monster.id}")
  end
end