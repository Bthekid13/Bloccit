include RandomData

# Create Posts
50.times do
# #1
  Post.create!(
# #2
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

#Creates Q's
5.times do
  Question.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph

  )
end


puts "Seed finished"
puts "#{Post.count} posts were created"
puts "#{Comment.count} comments were created"
puts "#{Question.count} Q's were asked"
