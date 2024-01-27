class DoctorsController < ApplicationController
  respond_to :json
  before_action :find_doctor, only: [:show, :destroy]

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: {
        message: 'Doctor created successfully'
      }, status: :ok
    else
      render json: {
        message: @doctor.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    render json: @doctor
  end

  def destroy
    @doctor.destroy
    head :no_content
    if !@doctor
      render json: { message: 'Doctor deleted' }, status: :ok
    else
      render json: { message: @doctor.errors.full_messages }, status: { code: 422 }
    end
  end

  private

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(
      :name, :age, :city_id, 
      :user_id, :description, 
      :image_url, detail_attributes: [
        :price, :specialization, :studies
      ])
  end
end
