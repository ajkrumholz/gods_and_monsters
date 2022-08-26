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
    @god = God.last

    expect(@god.name).to eq('Tzeentch')
    expect(@god.age).to eq(14)
    expect(@god.immortal).to eq(true)
    expect(page).to have_current_path("/gods")
  end

  # xit 'cannot create a god without name' do
  #   visit "/gods/new/"

  #   fill_in(:age, with: '14')
  #   choose(:immortal_true)
  #   click_on("Create God")
  #   expect(page).to have_current_path("/gods/new")
  # end

  # xit 'cannot create a god without age' do
  #   visit "/gods/new/"

  #   fill_in(:name, with: 'Tzeentch')
  #   choose(:immortal_true)
  #   click_on("Create God")
    
  #   expect(page).to have_current_path("/gods/new")
  # end

  # xit 'cannot create a god without immortal value' do
  #   visit "/gods/new/"

  #   fill_in(:name, with: 'Tzeentch')
  #   fill_in(:age, with: '14')
  #   click_on("Create God")
    
  #   expect(page).to have_current_path("/gods/new")
  # end

  it 'redirects to gods#index after creating' do
    visit "/gods/new/"

    fill_in(:name, with: 'Tzeentch')
    fill_in(:age, with: '14')
    choose(:immortal_true)
    click_on("Create God")

    expect(page).to have_current_path("/gods")
  end
end
