class Beer < ActiveRecord::Base
  include RatingAverage

  belongs_to :brewery, touch: true
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user
  belongs_to :style

  validates :name, length: {minimum: 1}
  validates :style_id, presence: true

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
  def self.top(n)
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating||0)}
    return sorted_by_rating_in_desc_order.take(n)
  end
end
