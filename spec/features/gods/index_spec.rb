require 'rails_helper'

RSpec.describe 'God Index Page' do
  it 'displays the name of a God' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    
    visit "/gods"

    expect(page).to have_link("Khorne", href: "/gods/#{khorne.id}")
  end

  it 'displays the name of all created Gods' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    ursun = God.create(name: "Ursun", age: 20, immortal: false)
    slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)
    
    visit "/gods"
    
    expect(page).to have_link("Khorne", href: "/gods/#{khorne.id}")
    expect(page).to have_link("Ursun", href: "/gods/#{ursun.id}")
    expect(page).to have_link("Slaanesh", href: "/gods/#{slaanesh.id}")
  end

  it 'displays the gods in chronological order from most recent' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    ursun = God.create(name: "Ursun", age: 20, immortal: false)
    slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)
    
    visit "/gods"

    expect(slaanesh.name).to appear_before(ursun.name)
    expect(ursun.name).to appear_before(khorne.name)
  end

  it 'links to home, gods, and monsters' do
    visit "/gods"

    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  it 'links to a page allowing the creation of new parents' do
    visit "/gods"

    expect(page).to have_link("Recognize a new God", :href => "/gods/new/")
  end  
end