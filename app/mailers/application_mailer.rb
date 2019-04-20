class ApplicationMailer < ActionMailer::Base
  default from: 'NoReply@medapp.com'
  layout 'mailer'

  def confirmation_email(user)
    @user = user
    @confirmation_code = @user.confirmation_code
    mail(to: @user.email, subject: 'Confirmation Email for MedApp')
  end

  def password_reset_email(user)
    @user = user
    @password_reset_token = @user.reset_password_token
    mail(to: @user.email, subject: 'Reset Your Password for MedApp')
  end
end
