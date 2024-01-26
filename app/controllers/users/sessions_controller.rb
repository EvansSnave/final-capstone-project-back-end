class Users::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def respond_with(_resource, _opts = {})
    render json: {
      message: 'Logged in',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return unless current_user

    log_out_failure
  end

  def log_out_success
    render json: {
      message: 'Logged out'
    }, status: :ok
  end

  def log_out_failure
    render json: {
      message: 'Something went wrong'
    }, status: :unauthorized
  end
end
