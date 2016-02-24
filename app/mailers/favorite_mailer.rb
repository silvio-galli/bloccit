class FavoriteMailer < ApplicationMailer
  default from: "silvio.galli@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
    headers["References"] = "<post/#{post.id}@bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<posts/#{post.id}@bloccit.com>"
    headers["In-Reply-To"] = "<posts/#{post.id}@bloccit.com>"
    headers["References"] = "<posts/#{post.id}@bloccit.com>"

    @post = post

    mail(to: post.user.email, subject: "Created #{post.title} post on Bloccit.")
  end
end
