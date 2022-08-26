require 'rails_helper'

RSpec.describe 'Monster update' do
  before(:each) do
    @khorne = God.create(name: "Khorne", age: 20, immortal: false)
    visit "/gods/#{@khorne.id}/edit"
  end

  it 'links to home, gods, and monsters' do
    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end

  it 'has a form to define the attributes of the new god' do
    expect(page).to have_field(:name)
    expect(page).to have_field(:age)
    expect(page).to have_field(:immortal_true)
    expect(page).to have_field(:immortal_false)
    expect(page).to have_button("Update #{@khorne.name}")
  end

  it 'updates a god using the form' do
    fill_in(:name, with: 'Khorne')
    fill_in(:age, with: '21')
    choose(:immortal_false)
    click_on("Update #{@khorne.name}")
    @god = God.order(:updated_at).last

    expect(@god.name).to eq('Khorne')
    expect(@god.age).to eq(21)
    expect(@god.immortal).to eq(false)
    expect(page).to have_current_path("/gods/#{@khorne.id}")
  end
end