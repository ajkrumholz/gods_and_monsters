require 'rails_helper'

RSpec.describe 'God Index Page' do
  before(:each) do
    @khorne = God.create(name: "Khorne", age: 20, immortal: false)
    @ursun = God.create(name: "Ursun", age: 20, immortal: false)
    @slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)

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
end