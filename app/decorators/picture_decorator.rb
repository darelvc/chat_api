class PictureDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      avatar: avatar.url(:original),
      type: type,
      user: get_user
    }
  end

  private
  def get_user
    {
      id: model.user.id,
      name: model.user.name,
      messages_count: model.user.messages_count,
      avatar: model.user.avatar.url
    }
  end
end
