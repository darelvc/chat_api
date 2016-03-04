class Api::MessagesController < ApplicationController

skip_before_action :authenticate, only: [:index, :show]

private

  def build_resource
    # @chat = @current_user.chats
    # @message = @chat.messages.build resource_params

    @message = Message.create resource_params
  end

  def resource
    @message
  end

  def collection
   @messages ||= Message.find params[:chat_id]
  end

  def resource_params
    params.require(:message).permit(:body, :chat_id)
  end

end
