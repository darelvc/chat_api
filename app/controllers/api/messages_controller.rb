class Api::MessagesController < Api::BaseController

  private
  def parent
    @chat ||= Chat.find params[:chat_id]
  end

  def build_resource
    @message = collection.new resource_params
  end

  def resource
    @message ||= collection.find(params[:id])
    #binding.pry
  end

  def collection
    @messages ||= parent.messages
  end

  def resource_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end
