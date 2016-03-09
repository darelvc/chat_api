class Api::BaseController < ApplicationController
  before_action :authenticate

  attr_reader :current_user

  def create
    build_resource

    resource.save!
  end

  def update
    resource.update! resource_params
  end

  def destroy
    resource.destroy!

    head :ok
  end

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.joins(:auth_token).find_by(auth_tokens: { value: token })
    end
  end
end
