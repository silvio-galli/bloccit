class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	has_many :labelings, as: :labelable
	has_many :labels, through: :labelings

	scope :publicly_viewable, -> { where(public: true) }
	scope :privately_viewable, -> { where(public: false) }
	scope :visible_to, -> (user) { user ? all : publicly_viewable }
=begin
	def visible_to(user)
		if user
			Topics.all
		else
			Topics.where(public: true)
		end
	end
=end
end
