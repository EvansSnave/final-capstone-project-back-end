class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find_by(name: params[:name])
    if user
      render json: {
        message: 'You are in',
        user: user
      }
    else
      render json: {
        message: 'Authentication failed',
      }, status: :unauthorized
    end
  end

  # private

  # def get_user_from_token
  #   auth = request.headers['Authorization']
  #   if auth
  #     jwt_payload = JWT.decode(auth.split(' ')[1],
  #                           Rails.application.credentials.devise[:jwt_secret_key]).first
  #     user_id = jwt_payload['sub']
  #     user = User.find(user_id.to_s)
  #   else
  #     nil
  #   end
  # end
end