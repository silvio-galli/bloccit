class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	has_many :labelings, as: :labelable
	has_many :labels, through: :labelings

	RATINGS = [ "PG", "PG13", "R" ]
	validates :rating, inclusion: { in: %w(PG PG13 R), message: "%{value} is not a valid rating" }
end
