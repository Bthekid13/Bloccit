require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
   let(:topic) { build(:topic) }
   let(:user) { build(:user) }
   let(:post) { build(:post) }

  describe "#favorite_for(post)" do
    before do
      topic = Topic.create!(name: "hello", description: "I don't like your tone.")
      @post = Post.create!(title: "hello", body: "I still don'e like your tone.", topic: topic, user: user)
    end
  end
end
