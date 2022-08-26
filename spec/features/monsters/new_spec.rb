require 'rails_helper'

RSpec.describe "Creation of a God's monster" do

  before(:each) do
    @khorne = God.create(name: "Khorne", age: 20, immortal: false)
    visit "/gods/#{@khorne.id}/menagerie/new"
  end

  describe "contains a nav bar" do
    it "links to gods#index, monsters#index, and home#index" do
      expect(page).to have_link("Home", :href => "/")
      expect(page).to have_link("Gods", :href => "/gods/")
      expect(page).to have_link("Monsters", :href => "/monsters/")
    end
  end

  describe "contains a form for monster creation" do
    it 'has fields for monster attributes' do
      expect(page).to have_field(:name)
      expect(page).to have_field(:strength_rank)
      expect(page).to have_field(:flying)
    end
  end

  describe "when filled out, the form creates a new monster" do
    describe "and the user is redirected to the god's monster index" do
      it 'creates a monster' do      
        fill_in(:name, with: "Bloodthirster")
        fill_in(:strength_rank, with: "9.5")
        choose(:flying_true)
        click_on("Create Monster")
        @monster = @khorne.monsters.last

        expect(@monster.name).to eq("Bloodthirster")
        expect(@monster.strength_rank).to eq(9.5)
        expect(@monster.flying).to eq(true)
        expect(@monster.god).to be(@khorne)
        expect(page).to have_current_path("/gods/#{@khorne.id}/menagerie")
      end
    end
  end
end