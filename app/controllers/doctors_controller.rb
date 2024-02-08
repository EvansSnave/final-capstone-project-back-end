class DoctorsController < ApplicationController
  respond_to :json
  before_action :find_doctor, only: %i[show destroy]

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: DoctorSerializer.new(@doctor).serializable_hash[:data][:attributes], status: :created
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
    if @doctor.destroy
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
      :user_id, :description, :avatar,
      :image_url, detail_attributes: %i[
        price specialization studies
      ]
    )
  end
end
