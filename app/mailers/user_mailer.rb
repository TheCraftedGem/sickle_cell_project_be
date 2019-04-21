class UserMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation Email for MedApp')
  end

  def password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Your Password for MedApp')
  end
end
