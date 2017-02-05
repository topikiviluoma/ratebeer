class Beer < ActiveRecord::Base
  include RatingAverage

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :name, length: {minimum: 1}

  def average
    return 0 if ratings.empty?
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end


  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "an #{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

  def to_s
    "#{name} - #{brewery.name}"
  end
end
