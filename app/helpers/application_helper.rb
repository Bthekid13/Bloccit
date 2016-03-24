module ApplicationHelper

  def form_group_tag(errors, &block)

    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
  def no_posts(user, posts)
    unless current_user.posts?
      "#{current_user.name} has not submitted any posts yet"
    end
  end
end
# <%= no_posts(current_user, current_user.posts) %>
