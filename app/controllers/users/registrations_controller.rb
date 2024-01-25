class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def respond_with(resource, _opts = {})
    register_success && return if !resource.persisted?
    register_failed
  end

  def register_success
    render json: {
      message: 'Sign up successfully',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: {
      message: 'Something went wrong'
    }, status: :unprocessable_entity
  end
end
