require 'rails_helper'

RSpec.describe "Gods#Show" do
  before(:each) do
    @khorne = God.create(name: "Khorne", age: 20, immortal: false)
    @bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    @hellhound = @khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
    visit "/gods/#{@khorne.id}"
  end

  it 'shows all attributes of the specified god' do
    expect(page).to have_content(@khorne.name)
    expect(page).to have_content(@khorne.age)
    expect(page).to have_content(@khorne.immortal)
    expect(page).to have_content(@khorne.created_at)
    expect(page).to have_content(@khorne.updated_at)
  end

  it 'shows the number of children for each god' do
    expect(page).to have_content(@khorne.monsters.count)
  end

  it 'links to home, gods, and monsters' do
    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  it 'links to the gods menagerie' do
    expect(page).to have_link("View the Menagerie", :href => "/gods/#{@khorne.id}/menagerie")
  end

  it 'links to the edit page' do
    expect(page).to have_link("Update #{@khorne.name}", :href => "/gods/#{@khorne.id}/edit")

    click_link("Update #{@khorne.name}")
    expect(page).to have_current_path("/gods/#{@khorne.id}/edit")
  end

  it 'has a link to delete the god' do
    expect(page).to have_link("Delete #{@khorne.name}", href: "/gods/#{@khorne.id}")

    click_link "Delete #{@khorne.name}"

    # expect(page).to have_current_path("/gods/")
    # expect(page).to_not have_link("#{@khorne.name}", href: "/gods/#{@khorne.id}")
  end
    
end