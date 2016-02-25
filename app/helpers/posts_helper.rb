module PostsHelper

  def user_can_edit_posts?(post)
    current_user && (current_user == post.user || current_user.admin? || current_user.moderator? )
  end

  def user_can_destroy?(post)
    current_user && (current_user.admin? || current_user = post.user )
  end
end
