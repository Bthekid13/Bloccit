require 'rails_helper'
include RandomData
<<<<<<< HEAD
=======

>>>>>>> checkpoint-41

RSpec.describe Comment, type: :model do

  let(:topic) { build(:topic) }
  let(:user) { build(:user) }
  let(:post) { build(:post) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:body) }
<<<<<<< HEAD
  # it { is_expected.to validate_presence_of(:body).is_at_least(5) }
=======
  it { is_expected.to validate_length_of(:body).is_at_least(5) }
>>>>>>> checkpoint-41


  describe "attributes" do
    it "responds to body" do
      expect(comment).to respond_to(:body)
    end
  end

  describe "after_create" do
    before do
      @another_comment = Comment.new(body: "Comment Body", post: post, user: user)
    end
    it "sends an email to users who have favorited the post" do
      favorite = user.favorites.create(post: post)
      expect(Mailman).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))

      @another_comment.save
    end

    it "does not send emails to users who haven't favorited the post" do
      expect(Mailman).not_to receive(:new_comment)

      @another_comment.save
    end
  end
end
