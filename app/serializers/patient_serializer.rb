class PatientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date_of_birth, :zip_code
end
