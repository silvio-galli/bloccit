class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	has_many :labelings, as: :labelable
	has_many :labels, through: :labelings

	scope :visible_to, -> (user) { user ? all : where(public: true) }
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
