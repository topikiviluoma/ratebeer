module RatingAverage
  def average_rating

    #ratings_score.inject(0.0) { |sum, el|sum + el }

    ratings.inject(0.0){ |sum, r| sum+r.score } / ratings.count

  end
end