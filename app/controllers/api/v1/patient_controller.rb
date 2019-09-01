class Api::V1::PatientController < ApplicationController
  def index
    @patients = Patient.all
    # Insert logic using fast_json to return all serialized patients
    render json: PatientSerializer.new(@patients)
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save!
      render json: { message: "#{patient.email} was created successfully."}, status: :ok
    else
      render json: { message: "#{patient.email} was not created."}, status: :unprocessable_entity
    end
  end

  def show
    !@patient = Patient.find_by_email(params[:email])
    if !@patient.nil?
      render json: PatientSerializer.new(@patient)
    else
      render json: { message: "Patient was not found.", errors: @patient.errors.full_messages}, status: :not_found
    end
  end

  def update
    @patient = Patient.find_by_email(params[:email])
    if @patient.update!(patient_params)
      render json: { message: "#{patient.email} was updated successfully."}, status: :ok
    else
      render json: { message: "Patient was not found or not updated successfully", errors: @patient.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    patient = Patient.find_by_email(params[:email])
    if patient.destory!
    end
  end

  private

  def patient_params
    require(patient).permit(:first_name, :last_name, :street_address, :city, :state, :zip_code, :last_visit, :office_id, :appointment_id, :scan_id)
  end
end
