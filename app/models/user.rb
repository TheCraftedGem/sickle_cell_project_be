class User < ApplicationRecord
  acts_as_google_authenticated
  has_secure_password
  has_many :offices

  enum role: [:default, :admin]
  enum status: [:inactive, :active]

  validates_presence_of :email, :password_digest, :first_name, :last_name, :role, :status, :street_address, :city, :state, :zip_code, :status
  validates_uniqueness_of :email 

  after_initialize do
    if self.new_record?
      self.role ||= :default
      self.status ||= :inactive
      self.confirmation_code = generate_url_safe_token
    end
  end

  def activate_user
    self.confirmation_code = nil
    self.status = :active
    self.confirmed_at = Time.now.utc
    save!
  end

  def generate_password_token
    self.reset_password_token = generate_url_safe_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end
  
  private

  def downcase_email
    self.email = self.email.downcase
    save!
  end

  def generate_url_safe_token
    SecureRandom.urlsafe_base64
  end
end
