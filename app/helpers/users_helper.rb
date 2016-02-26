module UsersHelper

  def user_has_got_posts?(user)
    user.posts.count > 0
  end

  def user_has_got_comments?(user)
    user.comments.count > 0
  end
end
