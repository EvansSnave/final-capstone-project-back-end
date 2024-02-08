class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  respond_to :json
  def index
    @users = User.all
    render json: @users
  end
end
