require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is saved if has name and style set" do
    beer = Beer.create name:"A le Coq", style:"Lager"
    expect(beer.valid?).to be(true)
    expect(Beer.count).to eq(1)
  end
  it "is not saved if name is not set" do
    beer = Beer.create style:"Lager"
    expect(beer).not_to be_valid
  end
  it "is not saved if style is not set" do
    beer = Beer.create name:"Tuplapukki"
    expect(beer).not_to be_valid
  end
end