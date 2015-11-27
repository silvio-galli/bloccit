class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	belongs_to :rating
	has_many :labelings, as: :labelable
	has_many :labels, through: :labelings

	scope :order_by_newest_first, -> { order(created_at: :desc) }
end
