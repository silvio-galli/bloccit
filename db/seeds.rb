include RandomData

15.times do
	Topic.create!(
		name: RandomData.random_sentence,
		description: RandomData.random_paragraph
		)
end
topics = Topic.all

50.times do
	Post.create!(
		topic: topics.sample,
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

50.times do
	SponsoredPost.create!(
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
		price: rand(10..100)
		)	
end

puts "Seeds finished!"
puts "#{Topic.count} topics created."
puts "#{Post.count} posts created."
puts "#{SponsoredPost.count} Sponsored Posts created."
puts "#{Comment.count} comments created."