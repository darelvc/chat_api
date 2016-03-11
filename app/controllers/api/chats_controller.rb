class Api::ChatsController < Api::BaseController
  load_and_authorize_resource

  skip_load_and_authorize_resource only: :create

  private
  def build_resource
    @chat = Chat.build current_user, resource_params
  end

  def collection
    @chats ||= current_user.chats
  end

  def resource
    @chat ||= Chat.find params[:id]
  end

  def resource_params
    params.require(:chat).permit(:name, :description, user_ids: [])
  end
end
