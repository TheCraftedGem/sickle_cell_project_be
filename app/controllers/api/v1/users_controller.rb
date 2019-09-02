class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    @user = User.create(user_params) if valid_password?
    if valid_password? && @user.save
      UserMailer.confirmation_email(@user).deliver_now
      render json: {message: "The user #{user_params[:email]} was created, they will need to confirm their email."}
    else
      render json: {message: "The user #{user_params[:email]} was not created."}, status: :unprocessable_entitiy
    end
  end

  def show
    # Might not need a show method for users, as the users are the providers and they wouldn't need to see one provider.
  end

  def index
    # Might not need an index either, as this should be managed by the admin panel. Do we need to be able to list providers?  
  end

  def destroy
    # This depends on whether or not we need the providers to be managed on site.
  end

  def update
    user = User.find_by(email: params[:email])

    if params[:password] && params[:old_password] && @current_user.password == params[:old_password]
      render json: {message: "#{@current_user.email}'s password has been successfully changed."}, status: :ok if @current_user.reset_password(params[:password])
    elsif params[:password] && params[:old_password] && @curent_user.password != params[:old_password]
      render json: {message: "#{@current_user.email}'s password was not changed.", errors: @current_user.errors.full_messages}, status: :unprocessable_entity
    elsif params[:password].nil? && user.update!(user_params)
      render json: { message: "#{user.first_name} was updated successfully." }, status: 200
    else
      render json: { message: "There was an error updating the user." }, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password, :office_id, :role, :status, :old_password, :password_confirmation)
  end

  def valid_password?
    params[:password] == params[:password_confirmation]
  end
end
