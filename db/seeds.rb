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
10.times do
  Advertisement.create!(

  title: RandomData.random_sentence,
  copy: RandomData.random_paragraph,
  price: 99
  
  )
end


puts "Seed finished"
puts "#{Post.count} posts were created"
puts "#{Comment.count} comments were created"
puts "#{Advertisement.count} Ads were created"
