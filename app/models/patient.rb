class Patient < ApplicationRecord
  has_many :scans
  has_many :appointments
  has_many :offices, through: :appointments

  include PgSearch::Model
  multisearchable against: [:first_name, :last_name, :date_of_birth, :zip_code]

  validates_presence_of :first_name, :last_name, :last_visit, :phone_number, :date_of_birth, :zip_code
end
