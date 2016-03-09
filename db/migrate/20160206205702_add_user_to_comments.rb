class AddUserToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true, polymorphic: true
  end
end
