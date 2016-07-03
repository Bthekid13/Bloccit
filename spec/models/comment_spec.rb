# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'
include RandomData

RSpec.describe Comment, type: :model do

    describe "attributes" do # Using Shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
      it { should have_db_column(:body).of_type(:text) }
    end

    describe 'associations' do # Using Shoulda matchers http://matchers.shoulda.io/docs/v3.1.1/
      it { should belong_to(:post) }
      it { should belong_to(:user) }
    end

    describe 'validations' do
      it { should validate_presence_of(:body) }
      it { should validate_length_of(:body).is_at_least(5) }
      it { should validate_presence_of(:user) }
    end

    describe "after_create" do
      before do
        @user = User.create!(email: 'melinda@example.com', name: 'admin', password: 'helloworld', role: 0)
        @topic = Topic.create!(name: "Topic of discussion", description: "This has to be a little longer but not too long.")
        @post = Post.create!(title: "A Post for all ages", body: "Texty Texting Textily", user: @user, topic: @topic)
        @another_comment = Comment.create!(body: 'Comment Body', post: @post, user: @user)
      end

      it "does not send emails to users who haven't favorited the post" do
        expect(Mailman).not_to receive(:new_comment)

        @another_comment.save!
      end
    end

  end
