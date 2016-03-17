class Api::AvatarsController < Api::BaseController

  private
  def resource
    @profile ||= current_user
  end

  def resource_params
    params.require(:profile).permit(:avatar)
  end
end
