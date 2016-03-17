class MessageDecorator < Draper::Decorator
  delegate_all

  decorates_association :user

  def as_json *args
    {
      id: id,
      body: body,
      type: type,
      user_id: user_id,
      avatar: avatar
    }
  end
end
