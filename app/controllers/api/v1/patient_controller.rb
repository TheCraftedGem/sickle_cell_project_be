class Api::V1::PatientController < ApplicationController
  def index
    patients = Patient.all
    # Insert logic using fast_json to return all serialized patients
    return json: {}, status: :ok
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save!
      return json: { message: "#{patient.email} was created successfully."}, status: :ok
    else
      return json: { message: "#{patient.email} was not created."}, status: :unprocessable_entity
    end
  end

  def show
    patient = Patient.find_by_email(params[:email])
    if !patient.nil?
      # Insert logic using fast_json to return the serialized user
      return json: {}, status: :ok
    else
      return json: { message: "Patient was not found.", errors: patient.errors.full_messages}, status: :not_found
    end
  end

  def update
    patient = Patient.find_by_email(params[:email])
    if patient.update!(patient_params)
      return json: { message: "#{patient.email} was updated successfully."}, status: :ok
    else
      return json: { message: "Patient was not found or not updated successfully", errors: patient.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find_by_email(params[:email])
    if patient.destory!
    end
  end

  def private
    require(patient).permit(:first_name, :last_name, :street_address, :city, :state, :zip_code, :last_visit, :office_id, :appointment_id, :scan_id)
  end
end
