class Api::V1::PatientsController < ApplicationController
  def index
    patients = Patient.all
    # Insert logic using fast_json to return all serialized patients
    render json: {}, status: :ok
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
      # Insert logic using fast_json to render the serialized user
      render json: { message: "#{patient.first_name} was found." }, status: :ok
    else
      render json: { message: "Patient was not found."}, status: :not_found
    end
  end

  def update
    patient = Patient.find_by_id(params[:id])
    if patient.update!(patient_params)
      render json: { message: "#{patient.first_name} was updated successfully."}, status: :ok
    else
      render json: { message: "Patient was not found or not updated successfully", errors: patient.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find_by_id(params[:id])
    if patient.destory!
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :phone_number, :street_address, :city, :state, :zip_code, :last_visit, :office_id, :appointment_id, :scan_id)
  end
end
