class Recipients
  def initialize post
    @post = post
  end

  def emails
    User.joins(:chats).
      where.not(users: { id: @post.user_id }).
      where(chats: { id: @post.chat_id }).
      pluck(:email)
  end
end
