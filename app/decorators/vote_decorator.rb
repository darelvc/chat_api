class VoteDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      id: id,
      kind: kind
     }
  end
end
