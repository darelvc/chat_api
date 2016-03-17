class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      name: name,
      email: email,
      messages_count: messages_count,
      avatar: h.image_url(avatar :thumbnail)
    }
  end
end
