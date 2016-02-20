include RandomData

# Creates Topics

15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all



# Create Posts
50.times do
# #1
  Post.create!(
# #2
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all


# Create Comments
# #3
100.times do
  Comment.create!(
# #4
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

#Creates Advertisements
# 10.times do
#   Advertisement.create!(
#
#   title: RandomData.random_sentence,
#   copy: RandomData.random_paragraph,
#
#   )
# end


puts "Seed finished"
puts "#{Topic.count} topics were created"
puts "#{Post.count} posts were created"
puts "#{Comment.count} comments were created"
