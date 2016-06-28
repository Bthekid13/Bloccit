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


  describe "associations" do
      it { should_belong_to(@post)}
      it { should_belong_to(@user)}
  end
end
