class Api::MessagesController < Api::BaseController
  load_and_authorize_resource :chat

  load_and_authorize_resource :message, through: :chat

  private
  def build_resource; end

  def collection
    @messages ||= parent.messages
  end

  def resource
    @message
  end

  def parent
    @chat
  end

  def resource_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end
