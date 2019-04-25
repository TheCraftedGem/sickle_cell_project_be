class Appointment < ApplicationRecord
  belongs_to :office
  belongs_to :patient

  validates_presence_of :date, :last_visit, :appointment_result
  enum appointment_result: [:pending, :scheduled, :missed, :rescheduled, :canceled, :attended] 
end
