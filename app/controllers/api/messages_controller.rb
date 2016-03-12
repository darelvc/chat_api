class Api::MessagesController < Api::BaseController
  load_and_authorize_resource :chat

  load_and_authorize_resource :message, through: :chat

  #skip_load_resource :message, through: :chat, only: :create

  private
  def build_resource
    #@message = collection.new resource_params
  end

  def resource
    @message# ||= collection.find(params[:id])
  end

  def collection
    @messages ||= parent.messages
  end

  def parent
    @chat #||= Chat.find params[:chat_id]
  end

  def resource_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end
