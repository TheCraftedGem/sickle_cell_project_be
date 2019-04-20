class UserConfirmationController < ApplicationController
  def confirm_email
    user = User.find_by(confirmation_code: params[:id])
    if user
      user.activate_user
      redirect_to 'https://medapp.com/successful_activation'
    else
      redirect_to 'https://medapp.com/unsuccessful_activation'
  end
end
