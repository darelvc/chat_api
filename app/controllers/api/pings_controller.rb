class Api::PingsController < Api::BaseController
  load_and_authorize_resource :chat

  load_and_authorize_resource :ping, through: :chat

  private
  def build_resource
    @ping = collection.new(user: current_user)
  end

  def collection
    @pings ||= parent.pings
  end

  def resource
    @ping
  end

  def parent
    @chat
  end
end
