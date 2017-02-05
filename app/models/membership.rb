class Membership < ActiveRecord::Base
  has_many :users
  belongs_to :beer_club

end
