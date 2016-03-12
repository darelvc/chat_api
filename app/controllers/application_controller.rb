class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :resource, :collection

  skip_before_action :verify_authenticity_token, if: :json_request?

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @exception = exception

    render :exception
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  rescue_from CanCan::AccessDenied do |exception|
     render json: {"message" => "unauthorized"}.to_json, :status => 403
  end

  rescue_from ActionController::InvalidAuthenticityToken do
    render text: 'Token expired/invalid', status: 498
  end

  private
  def json_request?
    request.format.json?
  end
end
