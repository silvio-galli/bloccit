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

# Adding one unique post.

unique_post_title = RandomData.random_sentence
unique_post_body = RandomData.random_paragraph

=begin
if (posts.any? {|post| post.title == unique_title}) || (posts.any? {|post| post.body == unique_body})
	puts "The post is already in the database. Try again."
else
	Post.create!(
		title: unique_title,
		body: unique_body
		)
end
=end
Post.find_or_create_by(title: unique_post_title, body: unique_post_body)

puts "Now we have #{Post.count} posts."

unique_comment_body = RandomData.random_paragraph
Comment.find_or_create_by(post: posts.sample, body: unique_comment_body)

puts "Now we have #{Comment.count} comments."