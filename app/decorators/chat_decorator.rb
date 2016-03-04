class ChatDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      name: name,
      description: description,
    }
  end
end
