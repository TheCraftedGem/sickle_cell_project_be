class ApplicationController < ActionController::API
  before_action :authenticate_request
  # before_action :check_mfa

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: {error: 'Not Authorized'}, status: 401 unless @current_user && @current_user.active?
  end

  def check_mfa
    if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == @current_user : !user_mfa_session)
      redirect_to new_user_mfa_session_path
    end
  end
end
