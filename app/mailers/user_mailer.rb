class UserMailer < ApplicationMailer
  default from: 'NoReply@medapp.com'

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation Email for MedApp')
  end

  def self.password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Your Password for MedApp')
  end
end
