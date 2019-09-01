class Patient < ApplicationRecord
  has_many :scans
  has_many :appointments
  has_many :offices, through: :appointments

<<<<<<< HEAD
  validates_presence_of :first_name, :last_name, :street_address, :city, :state, :zip_code, :last_visit, :phone_number
=======
  validates_presence_of :name, :street_address, :city, :state, :zip_code, :last_visit, :date_of_birth
>>>>>>> 758bdfa346dacce1488e86d341b16a376c166871
end
