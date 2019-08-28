class Scan < ApplicationRecord
  belongs_to :patient
  validates_presence_of :result

  enum result: [:moderate, :severe, :indeterminate]
end
