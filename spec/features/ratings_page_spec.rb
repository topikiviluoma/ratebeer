require 'rails_helper'
include Helpers

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  describe "when several exist" do
    before :each do
      create_beers_with_ratings(FactoryGirl.create(:brewery), "helles", user, 10, 7, 9)
      visit ratings_path

    end

    it "all are shown at ratings page" do
      save_and_open_page
      expect(page).to have_content "anonymous 10.0"
      expect(page).to have_content "anonymous 7.0"
      expect(page).to have_content "anonymous 9.0"

    end

  end
end