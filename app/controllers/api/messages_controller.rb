class Api::MessagesController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show]

  private

  def parent
    @chat ||= Chat.find params[:chat_id]
  end

  def build_resource
    @message = parent.messages.build resource_params
  end

  def resource
    @message
  end

  def collection
    @messages ||= parent.messages.all
  end

  def resource_params
    params.require(:message).permit(:body, :chat_id)
  end
end
