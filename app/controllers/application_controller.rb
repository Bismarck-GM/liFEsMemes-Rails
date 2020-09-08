class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login

  def current_user
    @current_user ||= User.find_by_id(session[:user])
  end

  def require_login
    unless session[:user_id]
      flash[:notice] = ["You must be loged in."]
      redirect_to root_path
    end
  end
end
