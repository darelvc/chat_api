class ChatFactory
  include ActiveModel::Validations

  attr_reader :params, :user

  def initialize user, params = nil
    @params = params.try(:symbolize_keys) || {}

    @user = user
  end

  def update!
    chat.update params[:chat]
  end

  def save!

  end

  private

  def chat
    @chat ||= Chat.find params[:id]
  end
end
