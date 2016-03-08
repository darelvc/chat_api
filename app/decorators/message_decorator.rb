class MessageDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      body: body,
      user_id: user_id
    }
  end
end
