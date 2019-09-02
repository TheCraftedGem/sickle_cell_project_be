class Patient < ApplicationRecord
  has_many :scans
  has_many :appointments
  has_many :offices, through: :appointments

  validates_presence_of :first_name, :last_name, :last_visit, :phone_number, :date_of_birth, :zip_code
end
