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
      expect(page).to have_content(@bloodthirster.name)
      expect(page).not_to have_content(@hellhound.name)
      expect(page).not_to have_content(@elemental_bear.name)
      expect(page).not_to have_content(@daemonette.name)
      expect(page).to have_content(@daemon_priestess.name)
    end

    it 'links to home, gods, and monsters' do
      expect(page).to have_link("Home", :href => "/")
      expect(page).to have_link("Gods", :href => "/gods/")
      expect(page).to have_link("Monsters", :href => "/monsters/")
    end

    it 'links to edit page for each monster' do
      @monsters.each do |monster|
        if monster.flying?
          within("#monster_#{monster.id}") do
            expect(page).to have_link("Edit Monster", href: "/monsters/#{monster.id}/edit")
          end
        end
      end
    end
  end
end