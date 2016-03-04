class MessageDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      body: body
    }
  end
end
