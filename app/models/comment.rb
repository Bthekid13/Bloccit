class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :topic
<<<<<<< HEAD
  # after_create :send_favorite_emails

=======
  after_create :send_favorite_emails
>>>>>>> checkpoint-44

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      Mailman.new_comment(favorite.user, post, self).deliver_now
    end
  end
end
