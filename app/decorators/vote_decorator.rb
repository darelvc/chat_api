class VoteDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    {
      kind: kind
     }
  end
end
