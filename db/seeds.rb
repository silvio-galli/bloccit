# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


include RandomData

50.times do
	Post.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
		)	
end
posts = Post.all

100.times do
	Comment.create!(
		post: posts.sample,
		body: RandomData.random_paragraph
		)
end

puts "Seeds finished!"
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."


50.times do
	Question.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
		resolved: RandomData.random_check
		)	
end

puts "Second seeds finished!"
puts "#{Question.count} questions created."