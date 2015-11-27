class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]
  has_many :posts
  has_many :topics

  def self.update_rating(rating_string)
    return rating.none if rating_string.empty?
  end

end
