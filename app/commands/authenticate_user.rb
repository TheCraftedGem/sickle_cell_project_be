class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
    # @otp_code = otp_code
  end

  def call
    [JsonWebToken.encode(user_id: user.id), user] if (user && user.active? && user.confirmation_code.nil?)
  end

  private

  attr_accessor :email, :password, :otp_code

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password) 
    # && user.authenticate_otp(otp_code, drift: 20)

    errors.add :user_authentication, 'Invalid credentials.'
    nil
  end
end
