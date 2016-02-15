require 'rails_helper'

RSpec.describe Favorite, type: :model do
   let(:topic) { build(:topic) }
   let(:user) { build(:user) }
   let(:post) { build(:post) }

  describe "#favorite_for(post)" do
    before do
      topic = Topic.create!(name: "hello", description: "I don't like your tone.")
      @post = Post.create!(name: "hello", body: "I still don'e like your tone.")
    end

    it "returns 'nil' if the user has not favorited the post" do
      expect(user.favorite_for(@post)).to be_nil
    end

    it "returns the appropiate favorite if it exists" do
      favorite = user.favorites.where(post: @post).create

      expect(user.favorite_for(@post)).to eq(favorite)
    end
  end
end
