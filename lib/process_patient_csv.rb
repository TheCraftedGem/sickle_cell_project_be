require 'csv'

class ProcessPatientCSV
  def initialize(temp_csv)
    @csv = temp_csv
  end

  def add_patient_information
    CSV.parse(@csv, headers: true).each do

    end
  end
end