class UserConfirmationController < ApplicationController
  def confirm_email
    user = User.find_by(confirmation_code: params[:id])
    if user
      user.activate_user
      redirect_to 'https://medapp.com/successful_activation'
    else
      redirect_to 'https://medapp.com/unsuccessful_activation'
  end

  def forgot
    if params[:email].blank?
      render json: {message: 'Email not present.'}
    end

    user = User.find_by(email: params[:email].downcase)

    if user && user.active?
      user.generate_password_token
      UserMailer.
  end
end
