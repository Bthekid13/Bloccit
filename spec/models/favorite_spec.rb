require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  describe "#favorite_for(post)" do
    before do
      topic = Topic.create!(name: "hello", description: "I don't like your tone.")
      @post = Post.create!(title: "hello", body: "I still don'e like your tone.", topic: topic, user: user)
    end
  end
end
