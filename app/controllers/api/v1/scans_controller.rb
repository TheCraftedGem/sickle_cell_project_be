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
    scan = find_scan
    if scan.present?
      render json: ScanSerializer.new(scan)
    else
      render status: :not_found
    end
  end

  def index
    scans = Scan.where(patient_id: params[:patient_id])
    if !scans.empty?
      render json: ScanSerializer.new(scans)
    else
      render status: :not_found
    end
  end

  def update
    scan = find_scan
    if scan.update!(scan_params)
      render status: :ok
    else
      render status: :not_found
    end
  end

  def destroy
    scan = find_scan
    if scan.destroy!
      render status: :ok
    else
      render status: :not_found
    end
  end

  private

  def scan_params
    params.require(:scan).permit(:result, :note, :patient_id, :office_id)
  end

  def find_scan
    if params[:patient_id]
      return Scan.where(patient_id: params[:patient_id]).last
    else
      return Scan.where(id: params[:id]).last
    end
  end
end
