class Provider < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip_code
end
