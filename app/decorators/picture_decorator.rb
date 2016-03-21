class PictureDecorator < Draper::Decorator
  delegate_all

  decorates_association :user

  decorates_association :chat

  def as_json *args
    super only: [:id], methods: [:avatar, :user, :chat]
  end

  def avatar
    model.avatar.url :original
  end
end
