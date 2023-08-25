class PatientsController < ApplicationController

  def index
    @patients = Patient.all
    @appointments = Appointment.all
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def create  
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "Patient created successfully"
    else
      render :new
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path, notice: "Patient has been deleted."
  end

  private
  def patient_params
    params.require(:patient).permit(:name, :age)
  end
end
