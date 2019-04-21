class UserController < ApplicationController
  def create
    user.new(user_params)
    if user.save
      UserMailer.confirmation_email(user)
    else
    end
  end

  def update
    user = User.find_by(email: params[:email])

    if params[:password] && params[:old_password] && @current_user.password == params[:old_password]
      render json: {message: "#{@current_user.email}'s password has been successfully changed."}, status: :ok if @current_user.reset_password(params[:password])
    else
      render json: {message: "#{@current_user.email}'s password was not changed.", errors: @current_user.errors.full_messages}, status: :unprocessable_entity
    end


  end
end
