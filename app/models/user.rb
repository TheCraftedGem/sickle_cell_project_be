class User < ApplicationRecord
  # acts_as_google_authenticated :lookup_token => :google_secret
  extend ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::OneTimePassword

  define_model_callbacks :create
  has_one_time_password
  has_secure_password

  has_many :offices

  enum role: [:default, :admin]
  enum status: [:inactive, :active]

  validates_presence_of :email, :password_digest, :first_name, :last_name, :role, :status, :phone_number
  validates_uniqueness_of :email

  after_initialize do
    if self.new_record?
      self.role ||= :default
      self.status ||= :inactive
      self.confirmation_code = generate_url_safe_token
    end
  end

  def confirm_user
    self.confirmation_code = nil
    # MFA Logic Might Go Here In An If, After Email Confirmed 
    # Sends otp_code via text/email code to user that must be returned
    # if self.authenticate_otp(params[:otp_code], drift: 60) == true
    # self.status = :active
    self.confirmed_at = Time.now.utc
    save!
  end

  def confirmation_code_valid?
    (self.confirmation_sent_at + 30.days) > Time.now.utc
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
    SecureRandom.urlsafe_base64.to_s
  end
end
