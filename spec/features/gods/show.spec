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
end