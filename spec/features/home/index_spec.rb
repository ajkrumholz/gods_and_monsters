require 'rails_helper'

RSpec.describe 'Home' do
  it 'links to home, gods, and monsters' do
    visit '/'

    expect(page).to have_link("Home", :href => "/")
    expect(page).to have_link("Gods", :href => "/gods/")
    expect(page).to have_link("Monsters", :href => "/monsters/")
  end
end