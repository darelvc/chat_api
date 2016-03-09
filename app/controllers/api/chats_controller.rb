class Api::ChatsController < Api::BaseController
  #skip_before_action :authenticate, only: :index

  load_and_authorize_resource

  skip_load_resource only: :create

  private
  def build_resource
    @chat = Chat.new resource_params
  end

  def collection
    #@chats ||= Chat.all.decorate
    @chats ||= current_user.chats
  end

  def resource
    @chat ||= Chat.find params[:id]
  end

  def resource_params
    params.require(:chat).permit(:id, :name, :description, user_ids: []).tap do |hash|
      hash[:user_ids] = hash[:user_ids].push(current_user.id)
    end
  end
end
