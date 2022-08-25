require 'rails_helper'

RSpec.describe "Gods#Show" do
  it 'shows all attributes of the specified god' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    
    visit "/gods/#{khorne.id}"

    expect(page).to have_content(khorne.name)
    expect(page).to have_content(khorne.age)
    expect(page).to have_content(khorne.immortal)
    expect(page).to have_content(khorne.created_at)
    expect(page).to have_content(khorne.updated_at)
  end

  it 'shows the number of children for each god' do
    khorne = God.create!(name: "Khorne", age: 20, immortal: false)
    bloodthirster = khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
    hellhound = khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
    
    visit "/gods/#{khorne.id}"

    expect(page).to have_content(khorne.monsters.count)
  end

  it 'links to home, gods, and monsters' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)

    visit "/gods/#{khorne.id}/"

    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end
end