class ScanSerializer
  include FastJsonapi::ObjectSerializer
  attributes :result, :note, :patient_id, :office_id
end