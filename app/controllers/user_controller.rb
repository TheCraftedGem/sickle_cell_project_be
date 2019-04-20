class UserController < ApplicationController
  def create
    user.new(user_params)
    if user.save
      UserMailer.confirmation_email(user)
    else
    end
  end
end
