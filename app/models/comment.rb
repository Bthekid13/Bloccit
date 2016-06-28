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

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  after_create :send_favorite_emails

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
## Comment Model

   default_scope {order('updated_at ASC')}

  private

  def send_favorite_emails
     post.favorites.each do |favorite|
       Mailman.new_comment(favorite.user, post, self).deliver_now
     end
  end
end
