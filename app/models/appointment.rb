class Appointment < ApplicationRecord
  belongs_to :office
  belongs_to :patient
  belongs_to :user
  
  validates_presence_of :date, :appointment_result
  enum appointment_result: [:pending, :scheduled, :missed, :rescheduled, :canceled, :attended] 
end
