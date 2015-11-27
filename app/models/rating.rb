class Rating < ActiveRecord::Base
  enum severity: { PG: 0, PG13: 1, R: 2 }
  has_many :posts
  has_many :topics

  def self.update_rating(rating_string)
    if rating_string.present?
      rating = Rating.where(severity: rating_string.to_i).first_or_create
    else
      rating = Rating.where(severity: 'R').first_or_create
    end
    rating
  end

end
