require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it"if multiple are returned by the API, they are shown on the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
               [Place.new( name:"Oljenkorsi", id: 1),
               Place.new( name:"Juupajuu", id: 2)]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "Juupajuu"
  end

  it "if no locations are found in given city, returns error" do


    visit places_path
    fill_in('city', with: 'vantaa')
    click_button "Search"
    save_and_open_page

    expect(page).to have_content "No locations in vantaa"
  end
end