class AddCommentableToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :commentable, index: true, polymorphic: true
  end
end
