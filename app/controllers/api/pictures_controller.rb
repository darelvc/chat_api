class Api::PicturesController < Api::BaseController
  skip_before_action :verify_authenticity_token, only: :create

  load_and_authorize_resource :chat

  load_and_authorize_resource :picture, through: :chat

  skip_load_resource :picture, through: :chat, only: :create

  private
  def build_resource
    @picture = collection.new resource_params
  end

  def collection
    @pictures ||= parent.pictures
  end

  def resource
    @picture
  end

  def parent
    @chat ||= Chat.find params[:chat_id]
  end

  def resource_params
    params.require(:picture).permit(:avatar).merge(user: current_user)
  end
end
