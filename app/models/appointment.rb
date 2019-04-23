class Appointment < ApplicationRecord
    validates_presence_of :date, :last_visit
end
