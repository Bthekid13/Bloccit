class AddTopicToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :topic, index: true, foreign_key: true
  end
end
