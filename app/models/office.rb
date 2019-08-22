class Office < ApplicationRecord
  has_many :patients
  has_many :appointments
  has_many :users
  
  validates_presence_of :name, :street_address, :city, :state, :zip_code, :phone_number, :hours
end
