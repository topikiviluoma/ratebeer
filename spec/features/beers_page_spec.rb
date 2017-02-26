include Helpers
require 'rails_helper'
describe "Beers" do
  before :each do
    FactoryGirl.create :user
    FactoryGirl.create :style
    FactoryGirl.create :brewery, name: "Schlenkerla"
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
  end
  it "adds beer if has valid name" do
    save_and_open_page
    fill_in('Name', with: 'jokuolut')
    expect {
      click_button('Create Beer')
    }.to change { Beer.count }.by(1)

  end
  it "doesn't add beer if name is invalid" do
    click_button('Create Beer')
    expect(page).to have_content 'Name is too short (minimum is 1 character)'
  end
end