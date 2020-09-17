# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :require_login, :user_is_logged?

  def current_user
    User.find(session[:user_id])
  end

  def user_is_logged?
    !session[:user_id].nil?
  end

  def require_login
    unless session[:user_id]
      flash[:notice] = ['Error. You must be logged in before doing that action.']
      redirect_to new_session_path
    end
  end
end
