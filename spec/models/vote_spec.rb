# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :integer
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
include RandomData

RSpec.describe Vote, type: :model do

  @user = FactoryGirl.build(:user)
  @topic = Topic.create!(name: "Topic of discussion", description: "This has to be a little longer but not too long.")
  @post = Post.create!(title: "A Post for all ages", body: "Texty Texting Textily", user: @user, topic: @topic)
  let(:vote) { Vote.create!(value: 1, post: @post, user: @user)}

  describe "associations" do
    it { is_expected.to belong_to(:post)}
    it { is_expected.to belong_to(:user)}
    it { is_expected.to validate_presence_of(:value)}
    it { is_expected.to validate_inclusion_of(:value).in_array([-1,1])}
  end
end
