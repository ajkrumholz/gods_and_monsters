require 'rails_helper'

RSpec.describe 'The Menagerie of a God' do
 
  before(:each) do
    @khorne = God.create(name: "Khorne", age: 20, immortal: false)
    @skullcrusher = @khorne.monsters.create!(name: "Skullcrusher", strength_rank: 7.5, flying: false)
    @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    @hellhound = @khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
    @monsters = [@skullcrusher, @bloodthirster, @hellhound]
    visit "/gods/#{@khorne.id}/menagerie"
  end

  describe "gods#menagerie" do 

    it 'shows all the monsters and their attributes associated with a specific god' do
      @monsters.each do |monster|
        within("#monster_#{monster.id}") do
          expect(page).to have_content(monster.name)
          expect(page).to have_content(monster.strength_rank)
          expect(page).to have_content(monster.flying)
          expect(page).to have_content(monster.created_at)
          expect(page).to have_content(monster.updated_at)
        end
      end
    end
    
    describe 'alphabetical sort order' do
      it 'shows all of the menagerie in alphabetical order' do
        blo = "Bloodthirster"
        hel = "Hellhound"
        skul = "Skullcrusher"

        expect(blo).to appear_before(hel)
        expect(hel).to appear_before(skul)
      end
    end

    it 'links to home, gods, and monsters' do
      expect(page).to have_link("Home", :href => "/")
      expect(page).to have_link("Gods", :href => "/gods/")
      expect(page).to have_link("Monsters", :href => "/monsters/")
    end

    it 'has a link to create a new monster' do
      expect(page).to have_link("Summon New Monster", :href => "/gods/#{@khorne.id}/menagerie/new")
    end

    it 'has a link to update a created monster' do
      @monsters.each do |monster|
        within("#monster_#{monster.id}") do
          expect(page).to have_link("Edit Monster", href: "/monsters/#{monster.id}/edit")
        end
      end
    end

    it 'has a form to display only monsters above a given strength ranking' do
      expect(page).to have_field("min_strength_rank")
      expect(page).to have_button("Update Display")

      fill_in("min_strength_rank", with: 6.0)
      click_button("Update Display")
      
      expect(page).to have_content(@bloodthirster.name)
      expect(page).to have_content(@skullcrusher.name)
      expect(page).not_to have_content(@hellhound.name)
    end

    it 'has a link to delete a monster from the menagerie' do
      expect(page).to have_link("Delete #{@bloodthirster.name}")

      click_link("Delete Bloodthirster")

      expect(current_path).to eq("/monsters")
      expect(page).not_to have_content("Bloodthirster")
    end
  end
end