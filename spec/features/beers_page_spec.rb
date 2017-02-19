require 'rails_helper'

describe "Adding beers" do
  it "adds beer if has valid name" do
    style = FactoryGirl.create(:style)
    brewery = FactoryGirl.create(:brewery)
    visit new_beer_path
    fill_in('Name', with: 'jokuolut')
    expect {
      click_button('Create Beer')
    }.to change { Beer.count }.by(1)

  end
  it "doesn't add beer if name is invalid" do
    visit new_beer_path
    fill_in('Name', with: '')
    click_button('Create Beer')
    expect(page).to have_content 'Name is too short (minimum is 1 character)'
  end
end