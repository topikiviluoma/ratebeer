module RatingAverage
  def average_rating

    #ratings_score.inject(0.0) { |sum, el|sum + el }

    sum = 0.0
    ratings.each do |rating|
      sum = sum + rating.score
    end
    return sum/ratings.count
  end
end