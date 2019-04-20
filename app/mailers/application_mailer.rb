class ApplicationMailer < ActionMailer::Base
  default from: 'NoReply@medapp.com'
  layout 'mailer'

  def confirmation_email(user)
    @user = user
    @confirmation_code = @user.create_confirmation_code
    mail(to: @user.email, subject: 'Confirmation Email for MedApp')
  end
end
