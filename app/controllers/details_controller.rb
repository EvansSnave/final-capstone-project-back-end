class DetailsController < ApplicationController
  respond_to :json

  def show
    @detail = Detail.find(params[:id])
    render json: @detail
  end
end
