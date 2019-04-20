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
      create_confirmation_code
    end
  end

  def create_confirmation_code
    self.confirmation_code = SecureRandom.urlsafe_base64 if self.confirmation_code.nil?
  end

  def activate_user
    self.confirmation_code = nil
    self.status = :active
    self.confirmed_at = Time.now
  end
  
end
