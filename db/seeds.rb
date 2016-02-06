include RandomData

# Create Users
 5.times do
   User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all

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
    user:   users.sample,
    topic:  topics.sample,
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

user = User.first
 user.update_attributes!(
   email: 'billyburke13@gmail.com', # replace this with your personal email
   password: 'mustang'
 )


puts "Seed finished"
puts "#{User.count} users were created"
puts "#{Topic.count} topics were created"
puts "#{Post.count} posts were created"
puts "#{Comment.count} comments were created"
