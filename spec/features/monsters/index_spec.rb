require 'rails_helper'

RSpec.describe 'Monster Index Page' do
  describe "Index Page" do 
    before(:each) do
      @khorne = God.create(name: "Khorne", age: 20, immortal: false)
      @ursun = God.create(name: "Ursun", age: 20, immortal: false)
      @slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)
      @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
      @hellhound = @khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
      @elemental_bear = @ursun.monsters.create!(name: "Elemental Bear", strength_rank: 7.0, flying: false)
      @daemonette = @slaanesh.monsters.create!(name: "Daemonette", strength_rank: 3.5, flying: false)
      @daemon_priestess = @slaanesh.monsters.create!(name: "Daemon Priestess", strength_rank: 9.0, flying: true)
      visit '/monsters/'
      @monsters = [@bloodthirster, @hellhound, @elemental_bear, @daemonette, @daemon_priestess]
    end

    it 'displays the name of all flying monsters' do
      within("div#winged") do
        expect(page).to have_content(@bloodthirster.name)
        expect(page).not_to have_content(@hellhound.name)
        expect(page).not_to have_content(@elemental_bear.name)
        expect(page).not_to have_content(@daemonette.name)
        expect(page).to have_content(@daemon_priestess.name)
      end
    end

    it 'links to home, gods, and monsters' do
      expect(page).to have_link("Home", :href => "/")
      expect(page).to have_link("Gods", :href => "/gods/")
      expect(page).to have_link("Monsters", :href => "/monsters/")
    end

    it 'links to edit page for each flying monster in correct column' do
      within("div#winged") do
        expect(page).to have_link("Edit Monster", href: "/monsters/#{@bloodthirster.id}/edit")
        expect(page).to have_link("Edit Monster", href: "/monsters/#{@daemon_priestess.id}/edit")
        expect(page).not_to have_link("Edit Monster", href: "/monsters/#{@elemental_bear.id}/edit")
      end
    end
    
    it 'has a link to delete each winged monster' do
      within("div#winged") do
        expect(page).to have_link("Delete #{@bloodthirster.name}")

        click_link("Delete #{@bloodthirster.name}")

        expect(current_path).to eq("/monsters")
        expect(page).to_not have_content("#{@bloodthirster.name}")
      end

    end
  end
end