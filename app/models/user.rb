class User < ApplicationRecord
  has_secure_password

  enum role: [:default, :admin]
  enum status: [:inactive, :active]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  after_initialize do
    if self.new_record?
      self.role ||= :default
      self.status ||= :inactive
    end
  end
  
end
