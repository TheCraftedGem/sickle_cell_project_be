class Office < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip_code, :phone_number, :hours
end
