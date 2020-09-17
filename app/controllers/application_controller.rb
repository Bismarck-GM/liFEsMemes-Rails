class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login, :user_is_logged?

  def current_user
    User.find(session[:user_id])
  end

  def user_is_logged?
    !session[:user_id].nil?
  end

  def require_login
    redirect_to new_session_path, alert: 'Error. You must be logged in.' unless session[:user_id]
  end
end
