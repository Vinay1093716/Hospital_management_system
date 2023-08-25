class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
    @hospital = Doctor.find(params[:hospital_id])
  end

  def new
    @doctor = Doctor.new
  end

  def show
    @doctor = Doctor.find(params[:id])
    @hospital = Doctor.find(params[:hospital_id])
  end

  def create
    @doctor = @hospital.doctors.build(doctor_params)
    if @doctor.save
      flash[:success] = "Doctor created!"
      redirect_to hospitals_path
    else
      render :new
    end
  end

  private
  def doctor_params
    params.require(:doctor).permit(:name, :speciality, :hospital_id)
  end

end
