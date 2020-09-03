class ApplicationController < ActionController::Base

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless session[:user_id]
      flash[:errors] = ["You must be loged in."]
      redirect_to root_path
    end
  end
end
