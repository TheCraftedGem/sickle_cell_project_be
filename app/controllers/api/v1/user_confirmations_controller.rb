class Api::V1::UserConfirmationsController < ApplicationController
  skip_before_action :authenticate_request

  def confirm_email
    user = User.find_by(confirmation_code: params[:id])
    if user.present? && user.confirmation_code_valid?
      user.activate_user
      render json: { message: "User was successfully activated."}, status: :ok
    else
      render json: { message: "User was not successfully activated." }, status: :unprocessable_entity
    end
  end

  def forgot
    if params[:email].blank?
      return render json: {message: 'Email not present.'}, status: :not_found
    end

    user = User.find_by(email: params[:email].downcase)

    if user && user.active?
      user.generate_password_token
      UserMailer.password_reset_email(user)
      render json: {message: 'Password reset email sent.'}, status: :ok
    else
      render json: {message: 'Email address not found or user is not active'}, status: :not_found
    end
  end

  def show
    user = User.find_by()
  end

  def reset
    if params[:token].blank?
      return render json: {message: 'Token is not present in the request'}, status: :not_found
    end

    token = params[:token].to_s

    user = User.find_by(reset_password_token: token)

    if user && user.active && user.password_token_valid?
      if user.reset_password(params[:password])
        render json: {message: 'Password reset'}, status: :ok
      else
        render json: {message: "#{user.errors.full_messages}"}, status: :unprocessable_entity
      end
    else
      render json: {message: 'Link is not valid or expired, try generating a new link'}, status: :not_found
    end
  end
end
