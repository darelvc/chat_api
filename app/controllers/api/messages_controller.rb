class Api::MessagesController < Api::BaseController
  skip_before_action :authenticate, only: [:index, :show]

  private
  def parent
    @chat ||= Chat.find params[:chat_id]
  end

  def user
    @user ||= User.find_by_id(current_user.id)
  end

  def build_resource
    @message = Message.new resource_params
    @message.user_id = user.id
    @message.chat_id = parent.id
  end

  def resource
    #@message
    @message ||= parent.messages.find(params[:id]).decorate
    #binding.pry
  end

  def collection
    @messages ||= parent.messages.all.decorate
  end

  def resource_params
    params.require(:message).permit(:body, :chat_id, :user_id)
  end
end
