require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is saved if has name and style set" do
    beer = Beer.create name:"A le Coq", style_id: 1
    expect(beer.valid?).to be(true)
    expect(Beer.count).to eq(1)
  end
  it "is not saved if name is not set" do
    beer = Beer.create style_id: 1
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
  it "is not saved if style is not set" do
    beer = Beer.create name:"Tuplapukki"
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
end
