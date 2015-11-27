class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]
  has_many :posts
  has_many :topics

  def self.update_rating(rating_string)
    if rating_string.present?
      rating = Rating.where(severity: rating_string).first_or_create
    else
      rating = Rating.where(severity: 2).first_or_create
    end
    rating
  end

end
