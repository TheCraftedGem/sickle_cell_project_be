class Api::V1::PatientsController < ApplicationController
  def index
    @patients = Patient.all
    # Insert logic using fast_json to return all serialized patients
    render json: PatientSerializer.new(@patients)
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save!
      render json: { message: "#{patient.first_name} was created successfully."}, status: :ok
    else
      render json: { message: "#{patient.first_name} was not created."}, status: :unprocessable_entity
    end
  end

  def show
    patient = Patient.find_by_id(params[:id])
    if !patient.nil?
      render json: PatientSerializer.new(patient)
    else
      render json: { message: "Patient was not found."}, status: :not_found
    end
  end

  def update
    patient = Patient.find_by_id(params[:id])
    if patient && patient.update!(patient_params)
      render json: { message: "#{patient.first_name} was updated successfully."}, status: :ok
    else
      render json: { message: "Patient was not found or not updated successfully"}, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find_by_id(params[:id])
    if patient.destory!
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :zip_code, :last_visit, :phone_number, :office_id, :appointment_id, :scan_id, :date_of_birth)
  end
end
