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

    expect(page).to have_field(:name)
    expect(page).to have_field(:age)
    expect(page).to have_field(:immortal_true)
    expect(page).to have_field(:immortal_false)
  end

  it 'creates a new god using the form' do
    visit "/gods/new/"

    fill_in(:name, with: 'Tzeentch')
    fill_in(:age, with: '14')
    choose(:immortal_true)
    click_on("Create God")
    @god = God.order("created_at").last

    expect(@god.name).to eq('Tzeentch')
    expect(@god.age).to eq(14)
    expect(@god.immortal).to eq(true)
    expect(page).to have_current_path("/gods")
  end

  it 'cannot create a god without name' do
    visit "/gods/new/"

    fill_in(:age, with: '14')
    choose(:immortal_true)
    click_on("Create God")

    expect(page).to have_current_path("/gods/new")
  end

  xit 'cannot create a god without age' do
    visit "/gods/new/"

    fill_in(:name, with: 'Tzeentch')
    choose(:immortal_true)
    click_on("Create God")
    
    expect
  end

  xit 'cannot create a god without immortal value' do
    visit "/gods/new/"

    fill_in(:name, with: 'Tzeentch')
    fill_in(:age, with: '14')
    click_on("Create God")
    
    expect
  end

  it 'redirects to gods#index after creating' do
    visit "/gods/new/"

    fill_in(:name, with: 'Tzeentch')
    fill_in(:age, with: '14')
    choose(:immortal_true)
    click_on("Create God")

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