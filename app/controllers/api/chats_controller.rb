class Api::ChatsController < ApplicationController
  skip_before_action :authenticate

  private

  def parent
    @chat ||= Chat.find params[:id]
  end

  def build_resource
    @chat = Chat.new resource_params
    @chat.users << current_user
  end

  def collection
    @chats ||= Chat.all
  end

  def resource
    @chat ||= Chat.find params[:id]


    # if parent.users.ids.include?(1)
    #   #@chat = parent
    #   p parent.users.ids
    # else
    #   flash[:error] = "You must been invited to this chat room!"
    # end
  end

  def resource_params
    params.require(:chat).permit(:id, :name, :description, :private, user_ids: [])
  end
end
