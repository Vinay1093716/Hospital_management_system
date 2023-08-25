class HospitalsController < ApplicationController

  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end

  def show
    @hospital = Hospital.find(params[:id])
    @doctors = @hospital.doctors
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to hospitals_path, notice: "Hospital created successfully."
    else
      render :new
    end
  end

  private
  def hospital_params
    params.require(:hospital).permit(:name, :location)
  end
end
