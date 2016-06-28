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

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  after_save :update_post

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote" }, presence: true

  private

  def update_post
    post.update_rank
  end

end
