class Brewery < ActiveRecord::Base
  include RatingAverage
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers: #{beers.count}"
  end

  def average_rating

    #ratings_score.inject(0.0) { |sum, el|sum + el }

    sum = 0.0
    ratings.each do |rating|
      sum = sum + rating.score
    end
    return sum/ratings.count
  end
end
