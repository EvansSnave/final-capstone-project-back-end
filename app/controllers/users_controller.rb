class UsersController < ApplicationController
  respond_to :json
  def index
    @users = User.all
    render json: @users
  end
end
