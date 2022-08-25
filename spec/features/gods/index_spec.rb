require 'rails_helper'

RSpec.describe 'God Index Page' do

  it 'displays the name of a God' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    visit "/gods"

    expect(page).to have_content(khorne.name)
  end

  it 'displays the name of all created Gods' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    ursun = God.create(name: "Ursun", age: 20, immortal: false)
    slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)

    visit "/gods"

    expect(page).to have_content(khorne.name)
    expect(page).to have_content(ursun.name)
    expect(page).to have_content(slaanesh.name)
  end

  it 'displays the gods in chronological order from most recent' do
    khorne = God.create(name: "Khorne", age: 20, immortal: false)
    ursun = God.create(name: "Ursun", age: 20, immortal: false)
    slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)

    visit "/gods"

    expect(page.body).to match(/#{slaanesh.name}.*#{ursun.name}.*#{khorne.name}/m)
  end

  it 'links to home, gods, and monsters' do
    visit "/gods"

    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  it 'links to a page allowing the creation of new parents' do
    visit "/gods"

    expect(page).to have_link("Recognize a new God", :href => "/gods/new/")
  end  
end