# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  before do
    @topic = create :topic
    @user = create :user
    @post = create :post
    @favorite =  { Favorite.create!(post: post, user: user) }
  end

<<<<<<< HEAD

  describe "associations" do
      it { should_belong_to(@post)}
      it { should_belong_to(@user)}
=======
  describe "#favorite_for(post)" do
    before do
      topic = Topic.create!(name: "hello", description: "I don't like your tone.")
      @post = Post.create!(title: "hello", body: "I still don'e like your tone.", topic: topic, user: user)
    end
>>>>>>> fedacbc646599728313cea0423e1c345a7bb5bc3
  end
end
