class UserMailer < ApplicationMailer
  default from: 'NoReply@providerminder.com'

  def confirmation_email(user)
    @user = user
    @qr = RQRCode::QRCode.new(@user.provisioning_uri("Provider Minder"), size: 8, level: :h)
    mail(to: @user.email, subject: 'Confirmation Email for Provider Minder')
  end

  def self.password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Your Password for Provider Minder')
  end
end
