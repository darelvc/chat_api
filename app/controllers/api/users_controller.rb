class Api::UsersController < Api::BaseController
  skip_before_action :authenticate, only: :create

  private
  def build_resource
    @user = User.new resource_params
  end

  def resource
    @user ||= User.find(params[:id])
  end

  def collection
   @users ||= User.all
  end

  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
