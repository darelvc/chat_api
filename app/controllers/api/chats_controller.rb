class Api::ChatsController < ApplicationController
  skip_before_action :authenticate

  private

  def collection
    @chats ||= Chat.all
  end

  def resource
    @chat ||= Chat.find params[:id]
  end

end
