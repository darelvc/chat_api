class Api::UsersController < Api::BaseController
  skip_before_action :authenticate

  private
  def build_resource
    @user = User.new resource_params
  end

  def resource
    @user ||= User.find(params[:id]).decorate
    #@user
  end

  def collection
   @users ||= User.all
  end

  def resource_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end
end
