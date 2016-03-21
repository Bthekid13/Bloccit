require 'rails_helper'
include RandomData


RSpec.describe Comment, type: :model do

  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { create(:comment) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:body) }



  describe "attributes" do
    it "responds to body" do
      expect(comment).to respond_to(:body)
    end
  end

  describe "after_create" do
    # #22
    before do
      @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
    end

    # #23
    it "sends an email to users who have favorited the post" do
      favorite = user.favorites.create(post: post)
      expect(Mailman).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))

      @another_comment.save
    end

    # #24
    it "does not send emails to users who haven't favorited the post" do
      expect(Mailman).not_to receive(:new_comment)

      @another_comment.save
    end
  end
end
