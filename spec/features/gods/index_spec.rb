require 'rails_helper'

RSpec.describe 'God Index Page' do
  before(:each) do
    @khorne = God.create(name: "Khorne", age: 20, immortal: false)
    @ursun = God.create(name: "Ursun", age: 20, immortal: false)
    @slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)

    @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 9.0, flying: true)

    @elemental_bear = @ursun.monsters.create!(name: "Elemental Bear", strength_rank: 8.5, flying: false)
    @ice_leopard = @ursun.monsters.create!(name: "Ice Leopard", strength_rank: 4.0, flying: false)
    @little_grom = @ursun.monsters.create!(name: "Little Grom", strength_rank: 6.5, flying: false)

    @daemon_priestess = @slaanesh.monsters.create!(name: "Daemon Priestess", strength_rank: 9.0, flying: true)
    @soul_grinder = @slaanesh.monsters.create!(name: "Soul Grinder", strength_rank: 8.5, flying: false)

    visit "/gods"
  end

  it 'displays the name of all created Gods' do
    expect(page).to have_link("Khorne", href: "/gods/#{@khorne.id}")
    expect(page).to have_link("Ursun", href: "/gods/#{@ursun.id}")
    expect(page).to have_link("Slaanesh", href: "/gods/#{@slaanesh.id}")
  end

  it 'displays the gods in chronological order from most recent' do
    expect(@slaanesh.name).to appear_before(@ursun.name)
    expect(@ursun.name).to appear_before(@khorne.name)
  end

  it 'links to home, gods, and monsters' do
    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  it 'links to a page allowing the creation of new parents' do
    expect(page).to have_link("Recognize a new God", :href => "/gods/new/")
  end

  it 'has a link to edit each displayed god' do
    expect(page).to have_link("Edit Khorne", href: "/gods/#{@khorne.id}/edit")
    expect(page).to have_link("Edit Ursun", href: "/gods/#{@ursun.id}/edit")
    expect(page).to have_link("Edit Slaanesh", href: "/gods/#{@slaanesh.id}/edit")
  end

  it 'has a link to delete each god' do
    within("#god_#{@khorne.id}") do
      expect(page).to have_link("Delete")
      click_link("Delete")
    end
    expect(current_path).to eq("/gods")
    expect(page).to_not have_link("Khorne")
  end

  describe 'has a link to sort gods by number of monsters' do
    it 'displays and sorts by monster count' do
      expect(page).to have_link("Sort by number of monsters")

      click_link("Sort by number of monsters")

      expect("Ursun").to appear_before("Slaanesh")
      expect("Slaanesh").to appear_before("Khorne")
      expect(page).to have_content("#{@khorne.monsters.count}")
      expect(page).to have_content("#{@ursun.monsters.count}")
      expect(page).to have_content("#{@slaanesh.monsters.count}")
    end
  end
end