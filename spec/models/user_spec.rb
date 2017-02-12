require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username:"Pekka"

    expect(user.username) == "Pekka"
  end
  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end
  it "is saved with a proper password" do
    user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end
  it "with a proper password and two ratings, has the correct average rating" do
    user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"
    brewery = Brewery.new name: "test", year: 2000
    beer = Beer.new name: "testbeer", style: "teststyle"
    rating = Rating.new score: 10, beer: beer
    rating2 = Rating.new score: 20, beer: beer

    user.ratings << rating
    user.ratings << rating2

    expect(user.ratings.count).to eq(2)
    expect(user.average_rating).to eq(15.0)
  end
  it "is not saved without a proper password" do
    user = User.create username:"Pekka", password: "123", password_confirmation:"123"
    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end
  describe "favorite beer" do
    let(:user){FactoryGirl.create(:user) }

    it "has method for determining one" do
      expect(user).to respond_to(:favorite_beer)
    end

    it "without ratings does not have one" do
      expect(user.favorite_beer).to eq(nil)
    end

    it "is the only rated if only one rating" do
      beer = create_beer_with_rating(user, 10)

      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with highest rating if several rated" do
      create_beers_with_ratings(user, 10, 20, 15, 7, 9)
      best = create_beer_with_rating(user, 25)

      expect(user.favorite_beer).to eq(best)
    end
  end


end
def create_beer_with_rating(user, score)
  beer = FactoryGirl.create(:beer)
  FactoryGirl.create(:rating, score:score, beer:beer, user:user)
  beer
end
def create_beers_with_ratings(user, *scores)
  scores.each do |score|
    create_beer_with_rating(user, score)
  end
end
