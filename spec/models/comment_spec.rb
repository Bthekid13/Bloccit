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

  before do
    @topic = create :topic
    @user = create :user
    @post = create :post
    @comment = create :comment
  end

  describe "associations" do
    it { is_expected.to belong_to(@post) }
    it { is_expected.to belong_to(@user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(@user) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(5) }
  end


  describe "after_create" do
    it "sends an email to users who have favorited the post" do
      expect(comment).to respond_to(:body)
    end
  end

  describe "after_create" do

    it "sends an email to users who have favorited the post" do
      @user.favorites.create(post: post)
      expect(Mailman).to receive(@comment).with(user, post, @comment).and_return(double(deliver_now: true))

      @comment.save!
    end

    it "does not send emails to users who haven't favorited the post" do
      expect(Mailman).not_to receive(@comment)

      @comment.save
    end
  end
end
