class MessageDecorator < Draper::Decorator
  delegate_all

  decorates_association :user

  def as_json *args
    super only: [:id, :body, :type, :user_id]
  end
end
