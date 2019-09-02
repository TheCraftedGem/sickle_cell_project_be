class Patient < ApplicationRecord
  has_many :scans
  has_many :appointments
  has_many :offices, through: :appointments

  validates_presence_of :name, :street_address, :city, :state, :zip_code, :last_visit, :date_of_birth
end
