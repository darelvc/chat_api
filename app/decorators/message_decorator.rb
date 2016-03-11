class MessageDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    #super only: %i(body user_id)
    {
      body: body,
      user_id: user_id
    }
  end
end
