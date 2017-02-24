module RatingAverage

  def average_rating

    #ratings_score.inject(0.0) { |sum, el|sum + el }
    if ratings.count == 0
      return 0.0
    else
      ratings.inject(0.0) { |sum, r| sum+r.score } / ratings.count
    end
  end
end