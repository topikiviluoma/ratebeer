class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating

    #ratings_score.inject(0.0) { |sum, el|sum + el }

    sum = 0.0
    ratings.each do |rating|
      sum = sum + rating.score
    end
    return sum/ratings.count
  end
  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "an #{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
end
