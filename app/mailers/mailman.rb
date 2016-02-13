class Mailman < ApplicationMailer
  default from: 'billyburke13@gmail.com'

  def new_comment(user, post, comment)
    headers["Message-ID"]   = "<comments/#{comment.id}@murmuring-earth-8498.example"
    headers["In-Reply-To"]  = "<post/#{post.id}@murmuring-earth-8498.example"
    headers["References"]   = "<post/#{post.id}@murmuring-earth-8498.example"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"]   = "<comments/#{comment.id}@murmuring-earth-8498.example"
    headers["In-Reply-To"]  = "<post/#{post.id}@murmuring-earth-8498.example"
    headers["References"]   = "<post/#{post.id}@murmuring-earth-8498.example"

    @post = post

    mail(to: post.user.email, subject: "New comment on #{post.title}")
  end

end
