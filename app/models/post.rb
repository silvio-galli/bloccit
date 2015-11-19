class Post < ActiveRecord::Base
	has_many :comments

	after_save :check_for_spam

	private
	def check_for_spam
		self.title = "SPAM" if id % 5 == 0
		save
	end
end
