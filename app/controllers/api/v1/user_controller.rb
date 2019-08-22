class Api::V1::UserController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    user.new(user_params)
    if user.save
      UserMailer.confirmation_email(user)
      render json: {message: "The user #{user_params[:email]} was created."}
    else
      render json: {message: "The user #{user_params[:email]} was not created."}
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
    end
  end

  private

  def user_params
    require(user).permit(:email, :first_name, :last_name, :password, :address, :city, :state, :zip_code, :office_id, :role, :status, :old_password)
  end
end
