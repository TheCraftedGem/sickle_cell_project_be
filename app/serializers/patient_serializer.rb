class PatientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name, :date_of_birth, :zip_code
end
