require 'rails_helper'

RSpec.describe 'gods#new' do
  it 'links to home, gods, and monsters' do
    visit "/gods/new"

    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  it 'has a form to define the attributes of the new god' do
    visit "/gods/new/"

    expect(page).to have_field("god[name]")
    expect(page).to have_field("god[age]")
    expect(page).to have_field("god[immortal]")
  end

  it 'creates a new god using the form' do
    visit "/gods/new/"

    fill_in('god[name]', with: 'Tzeentch')
    fill_in('god[age]', with: '14')
    choose('immortal')
    click_on('submit')

    @god = God.order("created_at").last

    expect(@god.name).to eq('Tzeentch')
    expect(@god.age).to eq(14)
    expect(@god.immortal).to eq(true)
  end

  xit 'cannot create a god without' do
    visit "/gods/new/"

    fill_in('god[name]', with: 'Tzeentch')
    fill_in('god[age]', with: '14')
    choose('immortal')
    click_on('submit')
    
    expect
  end

  it 'redirects to gods#index after creating' do
    visit "/gods/new/"

    fill_in('god[name]', with: 'Tzeentch')
    fill_in('god[age]', with: '14')
    choose('immortal')
    click_on('submit')

    expect(page).to have_current_path("/gods")
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

end