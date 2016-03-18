class Api::PicturesController < Api::BaseController
  load_and_authorize_resource :chat

  load_and_authorize_resource :picture, through: :chat

  private
  def build_resource
  end

  def collection
    @pictures ||= parent.pictures
  end

  def resource
    @picture
  end

  def parent
    @chat
  end

  def resource_params
    params.require(:picture).permit(:avatar).merge(user: current_user)
  end
end
