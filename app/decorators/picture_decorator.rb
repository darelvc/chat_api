class PictureDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      avatar: avatar,
      type: type,
      user_id: user_id
    }
  end
end
