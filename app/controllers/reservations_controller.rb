class ReservationsController < ApplicationController
  respond_to :json
  before_action :get_reservation, only: %i[destroy show]

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: {
        message: 'Reservation created!'
      }, status: :ok
    else
      render json: {
        message: "Something went wrong. #{@reservation.errors.full_messages}"
      }, status: :unauthorized
    end
  end

  def destroy
    if @reservation.destroy
      render json: { message: 'Reservation deleted' },
             status: :ok
    else
      render json: { message: "Something went wrong. #{@reservation.errors.full_messages}" }
    end
  end

  def show
    render json: @reservation
  end

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  private

  def get_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :doctor_id, :schedule_date)
  end
end
