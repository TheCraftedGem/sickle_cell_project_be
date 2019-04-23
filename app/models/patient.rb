class Patient < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip_code, :last_visit
end
