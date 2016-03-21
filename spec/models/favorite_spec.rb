require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:favorite) { Favorite.create!(post: post, user: user) }


  describe "#favorite_for(post)" do
    before do
      topic = Topic.create!(name: "hello", description: "I don't like your tone.")
      @post = Post.create!(title: "hello", body: "I still don'e like your tone.", topic: topic, user: user)
    end
  end
end
