class PingDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      body: body,
      type: type,
      user_id: user_id
    }
  end
end
