class Api::V1::ScansController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    scan = Scan.new(scan_params)
    if scan.save!
      render status: :ok
    else
      render status: :unprocessable_entitiy
    end
  end

  def show
    scan = Scan.where(patient_id: params[:patient_id]).or(Scan.where(id: params[:id]))
    if !scan.empty?
      render json: ScanSerializer.new(scan)
    else
      render status: :not_found
    end
  end

  def index
    scans = Scan.find.where(patient_id: params[:patient_id])
    render json: ScanSerializer.new(scans)
  end

  def update
    
  end
  
  def destroy

  end

  private

  def scans_params
    params.require(:scans).permit(:result, :note, :patient_id, :office_id)
  end
end
